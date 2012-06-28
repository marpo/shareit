class CodeSnippet < ActiveRecord::Base
  attr_accessible :beschreibung, :code, :sprache, :titel, SPRACHE
  validates :sprache, inclusion: SPRACHE
  SPRACHE = [ "Ruby", "C", "Html", "etc." ]
end
