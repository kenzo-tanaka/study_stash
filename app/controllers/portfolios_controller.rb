class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: :show
  def index
    @portfolios = Portfolio.includes(:tags, :related_links, comments: [:user]).latest
    @tags = Tag.has_portfolios
  end

  def show
    @comment = Comment.new
    @comments = @portfolio.comments
    @tags = @portfolio.tags.includes(portfolios: [:related_links, :portfolio_tags, :tags, comments: [:user]])
    @related_portfolios = @tags.flat_map(&:portfolios).reject { |portfolio| portfolio == @portfolio }.uniq.take(2)
  end

  private

  def set_portfolio
    @portfolio = Portfolio.includes(:tags, :related_links, comments: [:user]).find(params[:id])
  end
end
