class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :respondents do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end

    create_table :responses do |t|
      t.belongs_to :respondent, foreign_key: true
      t.belongs_to :organization, foreign_key: true
      t.jsonb :data

      t.timestamps
    end
  end
end
