class User < ActiveRecord::Base
	acts_as_authentic do |c|
  end # block optional

  validates_presence_of :phone,:gender
  has_many :properties
  has_many :bookings 
  has_many :guest_bookings, :source=> :bookings, :through => :properties
end
