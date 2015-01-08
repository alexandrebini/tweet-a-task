class AddTimestamps < ActiveRecord::Migration
  def change
    add_column :phrases, :created_at, :datetime
    add_column :phrases, :updated_at, :datetime

    add_column :tasks, :created_at, :datetime
    add_column :tasks, :updated_at, :datetime

    add_column :managers, :created_at, :datetime
    add_column :managers, :updated_at, :datetime
  end
end