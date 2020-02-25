class TagsController < ApplicationController
  def show
    @tag = Tag.includes(:portfolios).find(params[:id])
    @portfolios = @tag.portfolios.includes(:tags, :related_links).latest
    @tags = Tag.has_portfolios.reject{ |tag| tag == @tag }
  end
end
