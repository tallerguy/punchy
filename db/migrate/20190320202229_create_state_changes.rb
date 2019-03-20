class CreateStateChanges < ActiveRecord::Migration[5.2]
  def change
    create_table :state_changes do |t|
      t.references :stateful, polymorphic: true
      t.string :name
      t.string :previous_state
      t.string :next_state
      t.references :user, index: true

      t.timestamps
    end
  end
end
