require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { create(:user) }
  let(:portfolio) { create(:portfolio) }
  let(:comment) { create(:comment, commentable: portfolio) }

  describe "#new" do
    subject { get new_comment_path }
    it { is_expected.to eq 200 }
  end

  describe "#new" do
    subject { get edit_comment_path(comment) }
    it { is_expected.to eq 200 }
  end

  describe "#create" do
    let(:comment_params) { attributes_for(:comment, commentable_type: 'Portfolio', commentable_id: portfolio.id, user_id: user.id) }
    subject { post comments_path, params: { comment: comment_params } }
    it do
      expect{ subject }.to change(Comment, :count).by(1)
    end
  end

  describe "#update" do
    let(:update_params) { attributes_for(:comment, content: 'updated.') }
    subject { patch comment_path(comment), params: { comment: update_params } }
    it do
      expect(subject)
      expect(comment.reload.content).to eq 'updated.'
    end
  end

  describe "#destroy" do
    let!(:comment) { create(:comment, commentable: portfolio) }
    subject { delete comment_path(comment) }
    it do
      expect{ subject }.to change(Comment, :count).by(-1)
    end
  end

end
