class Link < ActiveRecord::Base
  include ::Tags

  belongs_to :user
  has_many :kommentare, dependent: :destroy
 
  attr_accessible :beschreibung, :titel, :url, :tags
 
  validates :url, :titel, :user, :presence => true
  validates_format_of :url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
 
  def autor
  	user.name
  end

  def to_s
  	url
  end

end
