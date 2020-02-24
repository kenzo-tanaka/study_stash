class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: :show
  def index
    @portfolios = Portfolio.includes(:tags, :related_links)
    @tags = Tag.has_portfolios
  end

  def show
    @tags = @portfolio.tags.includes(:portfolios)
    @related_links = @portfolio.related_links
    @related_portfolios = @tags.flat_map(&:portfolios).reject { |portfolio| portfolio == @portfolio }
  end

  private

  def set_portfolio
    @portfolio = Portfolio.includes(:tags, :related_links).find(params[:id])
  end
end
