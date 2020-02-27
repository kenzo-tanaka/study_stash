require 'rails_helper'

RSpec.describe "admin/books/edit", type: :view do
  before(:each) do
    @admin_book = assign(:admin_book, Book.create!())
  end

  it "renders the edit admin_book form" do
    render

    assert_select "form[action=?][method=?]", admin_book_path(@admin_book), "post" do
    end
  end
end
