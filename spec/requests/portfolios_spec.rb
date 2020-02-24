require 'rails_helper'

RSpec.describe "Portfolios", type: :request do
  let(:portfolio) { create(:portfolio) }

  describe "GET /index" do
    subject { get portfolios_path }
    it { is_expected.to eq 200 }
  end
end
