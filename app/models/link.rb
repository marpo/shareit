class Link < ActiveRecord::Base
  belongs_to :user
  has_many :kommentare, dependent: :destroy
 
  attr_accessible :beschreibung, :titel, :url, :tags
 
  validates :url, :titel, :user, :presence => true
 
  def autor
  	user.name
  end

  def to_s
  	url
  end
end
