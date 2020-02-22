require 'rails_helper'

RSpec.describe "admin/portfolios/new", type: :view do
  before(:each) do
    assign(:admin_portfolio, Portfolio.new())
  end

  it "renders new admin_portfolio form" do
    render

    assert_select "form[action=?][method=?]", admin_portfolios_path, "post" do
    end
  end
end
