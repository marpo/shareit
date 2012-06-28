class ShareitController < ApplicationController
  skip_before_filter :authorize

  def index
  	@links = Link.all
  	@code_snippets = CodeSnippet.all
  	@eintraege = [@links, @code_snippets].flatten
  	@eintraege.sort! { |a, b| b.created_at <=> a.created_at  }
  end
end
