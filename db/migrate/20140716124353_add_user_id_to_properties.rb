class AddUserIdToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :user_id, :integer
  end

  def self.down
    remove_column :properties, :user_id
  end
end
