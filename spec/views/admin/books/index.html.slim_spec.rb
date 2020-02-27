require 'rails_helper'

RSpec.describe "admin/books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(),
      Book.create!()
    ])
  end

  it "renders a list of admin/books" do
    render
  end
end
