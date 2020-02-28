class TagsController < ApplicationController
  def show
    @tag = Tag.includes(:portfolios).find(params[:id])
    @portfolios = @tag.portfolios.includes(:tags, :related_links, comments: [:user]).latest
    @tags = Tag.has_portfolios.reject{ |tag| tag == @tag }
    @books = @tag.books.take(3)
  end
end
