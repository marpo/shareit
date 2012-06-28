class CodeSnippet < ActiveRecord::Base

  SPRACHE = [ "Ruby", "C", "Html", "etc." ]

  attr_accessible :beschreibung, :code, :sprache, :titel
  validates :sprache, inclusion: SPRACHE
  validates :titel, :code, :presence => true
end
