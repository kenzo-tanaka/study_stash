require 'rails_helper'

RSpec.describe "Admin::Books", type: :request do
  let(:book) { create(:book) }
  let(:admin) { create(:user, role: 'admin') }

  before { sign_in admin }

  describe "#index" do
    subject { get admin_books_path }
    it { is_expected.to eq 200 }
  end

  describe "#edit" do
    subject { get edit_admin_book_path(book) }
    it { is_expected.to eq 200 }
  end

  describe "#new" do
    subject { get new_admin_book_path }
    it { is_expected.to eq 200 }
  end

  describe "#update" do
    let(:update_book_params) { attributes_for(:book, title: 'update.') }
    subject { patch admin_book_path(book), params: { book: update_book_params } }
    it do
      expect(subject)
      expect(book.reload.title).to eq 'update.'
    end
  end

  describe "#create" do
    let(:book_params) { attributes_for(:book) }
    subject { post admin_books_path, params: { book: book_params } }
    it do
      expect { subject }.to change(Book, :count).by(1)
    end
  end

  describe "#destroy" do
    let!(:new_book) { create(:book) }
    subject { delete admin_book_path(new_book) }
    it do
      expect { subject }.to change(Book, :count).by(-1)
    end
  end
end
