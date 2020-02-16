require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  let(:schedule) { create(:schedule) }
  let(:user) { create(:user) }
  let(:study_language) { create(:study_language) }
  let(:schedule_params) { attributes_for(:schedule, memo: 'This is Test', user_id: user.id, study_language_id: study_language.id) }

  before { sign_in user }

  describe "GET #index" do
    subject { get schedules_path }
    it { is_expected.to eq 200 }
  end

  describe "GET #show" do
    subject { get schedule_path(schedule) }
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

  describe "PATCH #update" do
    subject { patch schedule_path(schedule), params: { schedule: schedule_params } }
    it '更新されること' do
      expect(subject)
      expect(schedule.reload.memo).to eq 'This is Test'
    end
  end

  describe "POST #create" do
    subject { post schedules_path, params: { schedule: schedule_params } }
    it { expect{ subject }.to change(Schedule, :count).by(1) }
  end

  describe "DELETE #destroy" do
    let!(:new_schedule){ create(:schedule, user: user) }
    subject { delete schedule_path(new_schedule) }
    it { expect{ subject }.to change(Schedule, :count).by(-1) }
  end
end
