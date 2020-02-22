require 'rails_helper'

RSpec.describe "admin/portfolios/edit", type: :view do
  before(:each) do
    @admin_portfolio = assign(:admin_portfolio, Portfolio.create!())
  end

  it "renders the edit admin_portfolio form" do
    render

    assert_select "form[action=?][method=?]", admin_portfolio_path(@admin_portfolio), "post" do
    end
  end
end
