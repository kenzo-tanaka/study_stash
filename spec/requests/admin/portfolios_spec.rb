require 'rails_helper'

RSpec.describe "Admin::Portfolios", type: :request do
  describe "GET /admin/portfolios" do
    it "works! (now write some real specs)" do
      get admin_portfolios_index_path
      expect(response).to have_http_status(200)
    end
  end
end
