require 'rails_helper'

RSpec.describe "admin/books/new", type: :view do
  before(:each) do
    assign(:admin_book, Book.new())
  end

  it "renders new admin_book form" do
    render

    assert_select "form[action=?][method=?]", admin_books_path, "post" do
    end
  end
end
