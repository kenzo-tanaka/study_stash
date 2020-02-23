class TagsController < ApplicationController
  def show
    @tag = Tag.includes(:portfolios).find(params[:id])
    @portfolios = @tag.portfolios.includes(:tags, :related_links)
    @tags = Tag.has_portfolios.reject{ |tag| tag == @tag }
  end
end
