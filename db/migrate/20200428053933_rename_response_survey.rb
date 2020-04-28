class RenameResponseSurvey < ActiveRecord::Migration[6.0]
  def change
    rename_table :responses, :surveys
  end
end
