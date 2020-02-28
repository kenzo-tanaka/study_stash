require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:book) { create(:book) }
  describe "GET /books" do
    subject { get books_path }
    it { is_expected.to eq 200 }
  end

  describe "GET #show" do
    subject { get book_path(book) }
    it { is_expected.to eq 200 }
  end
end
