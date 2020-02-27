require 'rails_helper'

RSpec.describe "admin/books/show", type: :view do
  before(:each) do
    @admin_book = assign(:admin_book, Book.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
