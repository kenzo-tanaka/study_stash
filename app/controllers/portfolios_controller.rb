class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: :show
  def index
    @portfolios = Portfolio.includes(:tags, :related_links, :comments).latest
    @tags = Tag.has_portfolios
  end

  def show
    @comments = @portfolio.comments
    @tags = @portfolio.tags.includes(portfolios: [:related_links, :portfolio_tags, :tags, :comments])
    @related_portfolios = @tags.flat_map(&:portfolios).reject { |portfolio| portfolio == @portfolio }.take(3)
  end

  private

  def set_portfolio
    @portfolio = Portfolio.includes(:tags, :related_links, comments: [:user]).find(params[:id])
  end
end
