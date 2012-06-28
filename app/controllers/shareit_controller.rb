require 'will_paginate/array'

class ShareitController < ApplicationController
  skip_before_filter :authorize

  def index
  	@links = Link.all
  	@code_snippets = CodeSnippet.all
  	@eintraege = [@links, @code_snippets].flatten
  	@eintraegepaginiert = @eintraege.paginate :page=>params[:page], :order=>'created_at desc', :per_page => 1
  	# @eintraege.sort! { |a, b| b.created_at <=> a.created_at  }
  end
end
