class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: :show
  def index
    @portfolios = Portfolio.includes(:tags)
    @tags = Tag.has_portfolios
  end

  def show; end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end
end
