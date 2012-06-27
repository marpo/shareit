class AnzeigeController < ApplicationController
  skip_before_filter :authorize

  def index
  	@links = Link.order(:title)
  end
end
