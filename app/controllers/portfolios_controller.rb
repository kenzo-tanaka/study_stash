class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: :show
  def index
    @portfolios = Portfolio.includes(:tags)
  end

  def show; end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end
end
