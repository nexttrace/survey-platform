# Google Cloud Run setup notes

Cribbing very hard from the Cloud Run demo app [unicodex](https://github.com/GoogleCloudPlatform/django-demo-app-unicodex), these are the steps I followed to set up the initial deploy of NextTrace to Google Cloud Run.

&mdash; André

```
export PROJECT_ID=dynamic-return-274121
gcloud config set project $PROJECT_ID
gcloud components update
gcloud config set run/platform managed
export REGION=us-central1
gcloud config set run/region $REGION
export SERVICE_NAME=nexttrace
gcloud iam service-accounts create $SERVICE_NAME --display-name "$SERVICE_NAME service account"
export CLOUDRUN_SA=${SERVICE_NAME}@${PROJECT_ID}.iam.gserviceaccount.com
for role in cloudsql.client run.admin; do
 gcloud projects add-iam-policy-binding $PROJECT_ID --member serviceAccount:$CLOUDRUN_SA --role roles/${role}
done
export INSTANCE_NAME=nexttrace-staging
export ROOT_PASSWORD=$(ruby -r securerandom -e 'puts SecureRandom.hex(32)')
gcloud sql instances create $INSTANCE_NAME --database-version POSTGRES_11 --tier db-f1-micro --region $REGION --project $PROJECT_ID --root-password $ROOT_PASSWORD
gcloud sql connect $INSTANCE_NAME
gcloud components install cloud_sql_proxy
cloud_sql_proxy
cloud_sql_proxy -instances=$PROJECT_ID:$REGION:$INSTANCE_NAME=tcp:54321 &
psql -U postgres -h localhost -p 54321

CREATE DATABASE nexttrace;
CREATE USER nexttrace WITH PASSWORD 'random';
GRANT ALL PRIVILEGES ON DATABASE "nexttrace" TO nexttrace;

kill %1

export DBUSERNAME=nexttrace
export DBPASSWORD=random
export DATABASE_NAME=nexttrace

export DATABASE_URL=postgres://$DBUSERNAME:${DBPASSWORD}@//cloudsql/$PROJECT_ID:$REGION:$INSTANCE_NAME/$DATABASE_NAME

export PROJECTNUM=$(gcloud projects describe ${PROJECT_ID} --format 'value(projectNumber)')
export CLOUDBUILD_SA=${PROJECTNUM}@cloudbuild.gserviceaccount.com

export SENDGRID_API_KEY=sendgrid
export SECRET_KEY_BASE=random
export TWILIO_AUTH_TOKEN=twilio

for SECRET in DATABASE_URL SECRET_KEY_BASE SENDGRID_API_KEY TWILIO_AUTH_TOKEN; do
  gcloud secrets create $SECRET --replication-policy automatic
    
  echo -n "${!SECRET}" | gcloud secrets versions add $SECRET --data-file=-

  gcloud secrets add-iam-policy-binding $SECRET \
    --member serviceAccount:$CLOUDRUN_SA \
    --role roles/secretmanager.secretAccessor
done

for SECRET in DATABASE_URL SECRET_KEY_BASE; do
  gcloud secrets add-iam-policy-binding $SECRET \
    --member serviceAccount:$CLOUDBUILD_SA \
    --role roles/secretmanager.secretAccessor
done

gcloud builds submit --tag gcr.io/$PROJECT_ID/$SERVICE_NAME .

gcloud run deploy $SERVICE_NAME \
  --allow-unauthenticated \
  --image gcr.io/$PROJECT_ID/$SERVICE_NAME \
  --add-cloudsql-instances $PROJECT_ID:$REGION:$INSTANCE_NAME \
  --service-account $CLOUDRUN_SA \
  --update-env-vars RAILS_ENV=production,DEFAULT_URL_HOST=nexttrace.test,SENDGRID_API_KEY=abc123
  
export SERVICE_URL=$(gcloud run services describe $SERVICE_NAME \
  --format "value(status.url)" | sed 's|https://||')
  
gcloud run services update $SERVICE_NAME \
  --update-env-vars "DEFAULT_URL_HOST=${SERVICE_URL}"

for role in cloudsql.client run.admin; do
  gcloud projects add-iam-policy-binding ${PROJECT_ID} \
	  --member serviceAccount:${CLOUDBUILD_SA} \
	  --role roles/${role}
done

gcloud iam service-accounts add-iam-policy-binding ${CLOUDRUN_SA} \
  --member "serviceAccount:${CLOUDBUILD_SA}" \
  --role "roles/iam.serviceAccountUser"
```

Next, google for at least an hour trying to figure out how people approach running database migrations in Cloud SQL while deploying to Cloud Run, and discover that the unicodex example shoves database migrations into the cloudbuild docker build/push/deploy, in between push and deploy. Then discover that the official Google Cloud Medium hosts a Rails tutorial that tells you to run the migrations inside every container as they are starting up. Sigh.

Finally, get very sad after hours of googling only to discover that Rails doesn't support hosts starting with forward slash in `DATABASE_URL`. Separate all the components of the database connection into separate env vars and load them up in the `database.yml` file.
