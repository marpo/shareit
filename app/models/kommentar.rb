class Kommentar < ActiveRecord::Base
  
  attr_accessible :autor, :derkommentar, :link_id
  
  belongs_to :link
  belongs_to :user
  belongs_to :code_snippet

end
