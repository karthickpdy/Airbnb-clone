class AddHousetypeToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :housetype, :string
  end

  def self.down
    remove_column :properties, :housetype
  end
end
