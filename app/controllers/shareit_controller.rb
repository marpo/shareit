require 'will_paginate/array'

class ShareitController < ApplicationController
  skip_before_filter :authorize

  def index
    @kommentare = Kommentar.all
  	@links = Link.all
  	@code_snippets = CodeSnippet.all
  	@eintraege = [@links, @code_snippets].flatten
    @eintraege.sort! { |a, b| b.created_at <=> a.created_at  }
  	@eintraegepaginiert = @eintraege.paginate(:page=>params[:page], :order=>'created_at DESC', :per_page => 4)

  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  # GET /code_snippets/1
  # GET /code_snippets/1.json
  def show
    @code_snippet = CodeSnippet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @code_snippet }
    end
  end

  def rss
 
  @eintraege = snippetsUndLinksKombinieren
  respond_to do |format|
  	format.atom
  end
  end

end
