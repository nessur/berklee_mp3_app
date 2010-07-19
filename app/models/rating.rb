class Rating < ActiveRecord::Base
  belongs_to :mp3
  
  validates_inclusion_of :value, :in => 1..5, :message => " {{value}} is not between 1 and 5"
end
