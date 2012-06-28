class Link < ActiveRecord::Base
  belongs_to :user
 
  attr_accessible :beschreibung, :titel, :url
 
  validates :url, :titel, :user, :presence => true
 
  def autor
  	user.name
  end

  def to_s
  	url
  end
end
