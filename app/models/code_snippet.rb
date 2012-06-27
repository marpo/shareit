class CodeSnippet < ActiveRecord::Base
  attr_accessible :beschreibung, :code, :sprache, :titel
  validates :sprache, inclusion: SPRACHE
  SPRACHE = [ "Ruby", "C", "Html", "etxc" ]
end
