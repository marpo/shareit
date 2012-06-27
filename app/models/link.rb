class Link < ActiveRecord::Base
  attr_accessible :beschreibung, :titel, :url
  validates :url, :titel, :presence => true
end
