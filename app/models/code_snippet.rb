class CodeSnippet < ActiveRecord::Base
  SPRACHE = [ "ruby", "html", "css", "erb", "java", "javascript", "json", "php", "c++", "xml", "sql", "yaml", "python", "diff", "c", "clojure", "delphi" ]

  include ::Tags

  belongs_to :user
  has_many :kommentare, dependent: :destroy, :foreign_key => "link_id"

  attr_accessible :beschreibung, :code, :sprache, :titel, :tags
  
  validates :sprache, inclusion: SPRACHE
  validates :titel, :code, :autor, :presence => true

  def autor
  	user.name
  end
  
  def to_s
  	code
  end
  
end
