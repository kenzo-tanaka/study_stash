class TagsController < ApplicationController
  def show
    @tag = Tag.includes(:portfolios).find(params[:id])
    @tags = Tag.has_portfolios.reject{ |tag| tag == @tag }
  end
end
