class CreateRespondents < ActiveRecord::Migration[6.0]
  def change
    create_table :respondents do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.belongs_to :survey_invitation, null: false, foreign_key: true
      t.belongs_to :agency, null: false, foreign_key: true
    end
  end
end
