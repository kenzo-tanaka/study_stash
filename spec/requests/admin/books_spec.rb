require 'rails_helper'

RSpec.describe "Admin::Books", type: :request do
  describe "GET /admin/books" do
    it "works! (now write some real specs)" do
      get admin_books_index_path
      expect(response).to have_http_status(200)
    end
  end
end
