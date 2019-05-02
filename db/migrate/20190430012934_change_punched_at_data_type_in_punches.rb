class ChangePunchedAtDataTypeInPunches < ActiveRecord::Migration[5.2]
  def change
    change_column :punches, :punched_at, :timestamp
  end
end
