class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :property_id
      t.date :from
      t.date :to
      t.integer :no_guest
      
      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
