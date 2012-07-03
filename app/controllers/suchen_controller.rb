class SuchenController < ApplicationController
  include ::Tags
  helper :suchen

  def create
  	@eintraege = suchebearbeitung(params[:sucheeingabe])
  	@eintraegepaginiert = @eintraege.paginate :page=>params[:page], :order=>'created_at desc', :per_page => 4
  	
  	# @eintraege.sort! { |a, b| b.created_at <=> a.created_at  }

  	respond_to do |format|
      format.html { render 'shareit/index'}
      format.json { render json: @links }
    end
  end

  def suchebearbeitung(eingabe)
    eingabe.strip!
    eingabe.downcase!
    rueckgabe = []
  	if eingabe.start_with?("tags:")
        eingabe.gsub!('tags:', '') 
        @links = Link.find_by_sql("SELECT * FROM links WHERE tags LIKE '%#{eingabe.strip}%'")
        @code_snippets = CodeSnippet.find_by_sql("SELECT * FROM code_snippets WHERE tags LIKE '%#{eingabe.strip}%'") 
        rueckgabe = [@links, @code_snippets].flatten
    elsif eingabe.start_with?("beschreibung:")
        eingabe.gsub!('beschreibung:', '')
        @links = Link.find_by_sql("SELECT * FROM links WHERE beschreibung LIKE '%#{eingabe.strip}%'")
        @code_snippets = CodeSnippet.find_by_sql("SELECT * FROM code_snippets WHERE beschreibung LIKE '%#{eingabe.strip}%'")
        rueckgabe = [@links, @code_snippets].flatten
      elsif eingabe.start_with?("titel:")
        eingabe.gsub!('titel:', '')
        @links = Link.find_by_sql("SELECT * FROM links WHERE titel LIKE '%#{eingabe.strip}%'")
        @code_snippets = CodeSnippet.find_by_sql("SELECT * FROM code_snippets WHERE titel LIKE '%#{eingabe.strip}%'")
        rueckgabe = [@links, @code_snippets].flatten
  	else
  		@links = Link.find_by_sql("SELECT * FROM links WHERE titel LIKE '%#{eingabe}%' OR tags LIKE '%#{eingabe}%' OR beschreibung LIKE '%#{eingabe}%'")
    		@code_snippets = CodeSnippet.find_by_sql("SELECT * FROM code_snippets WHERE titel LIKE '%#{eingabe}%' OR tags LIKE '%#{eingabe}%' OR beschreibung LIKE '%#{eingabe}%'")
    		rueckgabe = [@links, @code_snippets].flatten
  	end
    rueckgabe
  end
   
end
