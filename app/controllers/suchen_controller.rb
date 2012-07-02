class SuchenController < ApplicationController

  helper :suchen

  def create
  	@eintraege = suchebearbeitung(params[:sucheeingabe])
  	@eintraegepaginiert = @eintraege.paginate :page=>params[:page], :order=>'created_at desc', :per_page => 5
  	
  	# @eintraege.sort! { |a, b| b.created_at <=> a.created_at  }

  	respond_to do |format|
      format.html { render 'shareit/index'}
      format.json { render json: @links }
    end
  end

  def suchebearbeitung(eingabe)
    eingabe.strip!
    eingabe.downcase!
  	if eingabe.start_with?("TAGS:")
    		@links = Link.where(:tags => eingabe.sub(/[TAGS:]/, ''))
    		@code_snippets = CodeSnippet.where(:tags => eingabe.sub(/[TAGS:]/, ''))
    		rueckgabe = [@links, @code_snippets].flatten
  	else
  		@links = Link.find_by_sql("SELECT * FROM links WHERE titel LIKE '%#{eingabe}%' OR tags LIKE '%#{eingabe}%' OR beschreibung LIKE '%#{eingabe}%'")
    		@code_snippets = CodeSnippet.find_by_sql("SELECT * FROM code_snippets WHERE titel LIKE '%#{eingabe}%' OR tags LIKE '%#{eingabe}%' OR beschreibung LIKE '%#{eingabe}%'")
    		rueckgabe = [@links, @code_snippets].flatten
  	end
  end
   
end
