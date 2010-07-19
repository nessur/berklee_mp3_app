class Mp3 < ActiveRecord::Base
  has_many :ratings, :dependent => :destroy
  
 
  
  
end
