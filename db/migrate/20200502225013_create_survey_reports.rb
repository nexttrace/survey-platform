class CreateSurveyReports < ActiveRecord::Migration[6.0]
  def change
    create_table :survey_reports do |t|
      t.belongs_to :survey, null: false, foreign_key: true
      t.belongs_to :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
