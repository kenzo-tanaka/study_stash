class TagsController < ApplicationController
  def show
    @tag = Tag.includes(:portfolios).find(params[:id])
    @tags = Tag.all.reject{ |tag| tag == @tag }
  end
end
