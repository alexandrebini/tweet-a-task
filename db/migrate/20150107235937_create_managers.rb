class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :type
      t.references :task
      t.integer :status, default: 0
      t.string :url
      t.text :raw
    end
    add_index :managers, :task_id
    add_index :managers, :type
    add_index :managers, [:task_id, :type]
    add_index :managers, :status
  end
end