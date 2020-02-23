require 'rails_helper'

RSpec.describe "Tags", type: :request do
  let(:tag) { create(:tag) }
  describe "GET #show" do
    subject { get tag_path(tag) }
    it { is_expected.to eq 200 }
  end
end
