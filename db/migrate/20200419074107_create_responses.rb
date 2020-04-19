class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :organization, foreign_key: true
      t.jsonb :response_data

      t.timestamps
    end
  end
end
