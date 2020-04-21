class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.jsonb :data
      t.belongs_to :organization, null: false, foreign_key: true
      t.belongs_to :respondent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
