require 'rails_helper'

RSpec.describe "Admin::Portfolios", type: :request do
  let(:admin) { create(:user, :admin) }
  let(:portfolio) { create(:portfolio) }
  let(:portfolio_params) { attributes_for(:portfolio, title: 'Sample') }

  before { sign_in admin }

  describe "GET #index" do
    subject { get admin_portfolios_path }
    it { is_expected.to eq 200 }
  end

  describe "GET #show" do
    subject { get admin_portfolio_path(portfolio) }
    it { is_expected.to eq 200 }
  end

  describe "GET #edit" do
    subject { get edit_admin_portfolio_path(portfolio) }
    it { is_expected.to eq 200 }
  end

  describe "GET #new" do
    subject { get new_admin_portfolio_path }
    it { is_expected.to eq 200 }
  end

  describe "POST #create" do
    subject { post admin_portfolios_path, params: { portfolio: portfolio_params } }
    it do
      expect{ subject }.to change(Portfolio, :count).by(1)
    end
  end

  describe "PATCH #update" do
    subject { patch admin_portfolio_path(portfolio), params: { portfolio: portfolio_params } }
    it do
      expect(subject)
      expect(portfolio.reload.title).to eq 'Sample'
    end
  end

  describe "DELETE #destroy" do
    let!(:new_portfolio) { create(:portfolio) }
    subject { delete admin_portfolio_path(new_portfolio) }
    it do
      expect{ subject }.to change(Portfolio, :count).by(-1)
    end
  end
end
