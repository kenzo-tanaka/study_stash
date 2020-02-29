require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  let(:user) { create(:user) }
  let(:blog) { create(:blog, user: user) }

  before { sign_in user }

  describe "#show" do
    subject { get blog_path(blog) }
    it { is_expected.to eq 200 }
  end

  describe "#edit" do
    subject { get edit_blog_path(blog) }
    it { is_expected.to eq 200 }
  end

  describe "#new" do
    subject { get new_blog_path }
    it { is_expected.to eq 200 }
  end

  describe "#create" do
    let(:blog_params) { attributes_for(:blog) }
    subject { post blogs_path, params: { blog: blog_params } }
    it { expect{ subject }.to change(Blog, :count).by(1) }
  end

  describe "#update" do
    let(:update_params) { attributes_for(:blog, title: 'updated') }
    subject { patch blog_path(blog), params: { blog: update_params } }
    it do
      expect(subject)
      expect(blog.reload.title).to eq 'updated'
    end
  end

  describe "#destroy" do
    let!(:new_blog){ create(:blog, user: user) }
    subject { delete blog_path(new_blog) }
    it { expect{ subject }.to change(Blog, :count).by(-1) }
  end
end
