class CreateAgencyReports < ActiveRecord::Migration[6.0]
  def change
    create_table :agency_reports do |t|
      t.belongs_to :agency, null: false, foreign_key: true
      t.belongs_to :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
