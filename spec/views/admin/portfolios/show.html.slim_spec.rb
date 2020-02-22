require 'rails_helper'

RSpec.describe "admin/portfolios/show", type: :view do
  before(:each) do
    @admin_portfolio = assign(:admin_portfolio, Portfolio.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
