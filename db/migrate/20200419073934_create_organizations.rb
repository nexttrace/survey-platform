class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :city
      t.string :county
      t.string :state

      t.timestamps
    end
  end
end
