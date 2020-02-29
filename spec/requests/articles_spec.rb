require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:user) { create(:user) }
  let!(:blog) { create(:blog, user: user) }
  let(:article) { create(:article, blog: blog) }

  before { sign_in user }

  describe "#index" do
    subject { get articles_path }
    it { is_expected.to eq 200 }
  end

  describe "#edit" do
    subject { get edit_article_path(article) }
    it { is_expected.to eq 200 }
  end

  describe "#new" do
    subject { get new_article_path }
    it { is_expected.to eq 200 }
  end

  describe "#update" do
    let(:update_article_params) { attributes_for(:article, title: 'update.') }
    subject { patch article_path(article), params: { article: update_article_params } }
    it do
      expect(subject)
      expect(article.reload.title).to eq 'update.'
    end
  end

  describe "#create" do
    let(:article_params) { attributes_for(:article, blog_id: blog.id) }
    subject { post articles_path, params: { article: article_params } }
    it do
      expect { subject }.to change(Article, :count).by(1)
    end
  end

  describe "#destroy" do
    let!(:new_article) { create(:article, blog: blog) }
    subject { delete article_path(new_article) }
    it do
      expect { subject }.to change(Article, :count).by(-1)
    end
  end
end
