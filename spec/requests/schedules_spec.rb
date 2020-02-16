require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  let(:schedule) { create(:schedule) }

  describe "GET #index" do
    subject { get schedules_path }
    it { is_expected.to eq 200 }
  end

  describe "GET #show" do
    subject { get schedule_path(schedule) }
    it { is_expected.to eq 200 }
  end
end
