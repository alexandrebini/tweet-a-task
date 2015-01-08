class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :text
    end
    add_index :phrases, :text, unique: true
  end
end