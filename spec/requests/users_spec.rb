require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  let(:user) { create(:user) }
  let!(:schedule) { create(:schedule, user: user) }

  describe "GET #show" do
    subject { get user_path(user) }
    it { is_expected.to eq 200 }
  end

  describe "GET #login" do
    subject { get login_path }
    context "ゲストの時" do
      it { is_expected.to eq 200 }
    end

    context "ログインしている時" do
      before { sign_in user }
      it { is_expected.to eq 302 }
    end
  end
end
