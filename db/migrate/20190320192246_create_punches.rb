class CreatePunches < ActiveRecord::Migration[5.2]
  def change
    create_table :punches do |t|
      t.references :user, foreign_key: true
      t.string :type
      t.datetime :punched_at

      t.timestamps
    end
  end
end
