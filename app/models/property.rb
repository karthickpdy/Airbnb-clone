class Property < ActiveRecord::Base



	  validates_presence_of :name,:roomtype,:price,:city, :address,:guest,:avail_from,:avail_to;
	  validate :from_less_than_to

    named_scope :fcity, lambda { |city| 
      {:conditions => ['city = ?', city]} if(city.present?)};

    named_scope :fguest, lambda { |guest| 
      {:conditions => ['guest >= ?', guest] } if(guest.present?)};

    named_scope :favail_from, lambda { |avail_from| 
      {:conditions => ['avail_from <= ?', avail_from]} if(avail_from.present?)};

	named_scope :favail_to, lambda { |avail_to| 
      {:conditions => ['avail_to >= ?', avail_to]} if(avail_to.present?)};

named_scope :not_current_user, lambda { |user_id| 
      {:conditions => ['user_id <> ?', user_id]} if(user_id.present?)};




 def from_less_than_to
    if avail_from.present? && avail_from.present? && avail_from>avail_to
      errors.add(:avail_from, " date should not be greater than to date")
    end
 end

def self.return_search_result(params,current_user)
	Property.not_current_user(current_user.id).fcity(params[:city]).fguest(params[:guest]).favail_from(params[:from]).favail_to(params[:to])
end


def self.index_result(params,current_user)
 
 	if(params[:mylisting])
      current_user.properties
    else
     Property.not_current_user(current_user.id)
    end   
end

def self.create_properties(params,current_user)

	result={}
	
	@property = current_user.properties.build(params[:property])

      if @property.save

      	result[:message] = 'Listing was successfully created.'
        result[:class]="alert-success alert"
        result[:redirect]=(@property) 
        
      else


      	result[:message] = 'Err..There was an issue in creating...'+@property.errors.full_messages.to_sentence
        result[:class]="alert-error alert"
        result[:redirect]="/properties/new"
        

        return result
        
      end

      return result
    
end

def self.update_properties(params,current_user)
	@property = Property.find(params[:id])

      if @property.update_attributes(params[:property])
        
        result[:message] = 'Property was successfully updated.'
        result[:class]="alert-success alert"
        result[:redirect]=(@property) 
        
      else

      	result[:message] = 'Err..There was an issue in creating...'+@property.errors.full_messages.to_sentence
        result[:class]="alert-error alert"
        render :action => "edit"  
      end
    
end




	  belongs_to :user
	  has_many :bookings
end
