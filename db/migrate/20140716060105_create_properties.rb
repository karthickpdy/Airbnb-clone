class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.string :name
      t.string :roomtype
      t.float :price
      t.string :city
      t.string :address
      t.integer :guest
      t.date :avail_from
      t.date :avail_to
      
      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
