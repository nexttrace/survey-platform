class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, nullable: false
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
