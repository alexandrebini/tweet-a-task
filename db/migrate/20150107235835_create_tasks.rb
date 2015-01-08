class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :phrase
      t.string :name
      t.string :twitter_id
    end
    add_index :tasks, :phrase_id
    add_index :tasks, :twitter_id, unique: true
  end
end