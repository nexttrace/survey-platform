require "rails_helper"

RSpec.describe SurveyInvitationMailer, type: :mailer do
  describe "notification_email" do
    let(:mail) { SurveyInvitationMailer.notification_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Notification email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "contact_email" do
    let(:mail) { SurveyInvitationMailer.contact_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Contact email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
