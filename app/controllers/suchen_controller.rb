class SuchenController < ApplicationController
  def create
  	@links = Link.where(:tags => params[:sucheeingabe])
  	@code_snippets = CodeSnippet.where(:tags => params[:sucheeingabe])
  	@eintraege = [@links, @code_snippets].flatten
  	@eintraegepaginiert = @eintraege.paginate :page=>params[:page], :order=>'created_at desc', :per_page => 5
  	# @eintraege.sort! { |a, b| b.created_at <=> a.created_at  }

  	respond_to do |format|
      format.html { render 'shareit/index'}
      format.json { render json: @links }
    end
  end
end
