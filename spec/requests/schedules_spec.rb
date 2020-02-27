require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  let(:user) { create(:user) }
  let(:schedule) { create(:schedule, user: user) }
  let(:study_language) { create(:study_language) }
  let(:schedule_params) { attributes_for(:schedule, memo: 'This is Test', user_id: user.id, study_language_id: study_language.id) }
  let(:invalid_schedule_params) { attributes_for(:schedule, study_language_id: nil) }

  before { sign_in user }

  describe "GET #index" do
    subject { get schedules_path }
    it { is_expected.to eq 200 }
  end

  describe "GET #new" do
    subject { get new_schedule_path }
    it { is_expected.to eq 200 }
  end

  describe "GET #edit" do
    subject { get edit_schedule_path(schedule) }
    it { is_expected.to eq 200 }
  end

  describe "GET #dashboard" do
    subject { get dashboard_path }
    it { is_expected.to eq 200 }
  end

  describe "PATCH #update" do
    subject { patch schedule_path(schedule), params: { schedule: schedule_params } }
    context "有効なパラメータの時" do
      it '更新されること' do
        expect(subject)
        expect(schedule.reload.memo).to eq 'This is Test'
      end
    end
    context "無効なパラメータの時" do
      let(:schedule_params) { invalid_schedule_params }
      it '更新されないこと' do
        expect(subject)
        expect(schedule.reload.memo).not_to eq 'This is Test'
        expect(schedule.reload.memo).to eq schedule.memo
      end
    end
  end

  describe "POST #create" do
    subject { post schedules_path, params: { schedule: schedule_params } }
    context "有効なパラメータの時" do
      it { expect{ subject }.to change(Schedule, :count).by(1) }
    end
    context "無効なパラメータの時" do
      let(:schedule_params) { invalid_schedule_params }
      it '更新されること' do
        expect{ subject }.not_to change(Schedule, :count)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:new_schedule){ create(:schedule, user: user) }
    subject { delete schedule_path(new_schedule) }
    it { expect{ subject }.to change(Schedule, :count).by(-1) }
  end
end
