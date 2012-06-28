class CodeSnippet < ActiveRecord::Base
  SPRACHE = [ "Ruby", "C", "Html", "etc." ]

  belongs_to :user

  attr_accessible :beschreibung, :code, :sprache, :titel
  
  validates :sprache, inclusion: SPRACHE
  validates :titel, :code, :autor, :presence => true

  def autor
  	user.name
  end
  
  def to_s
  	code
  end
end
