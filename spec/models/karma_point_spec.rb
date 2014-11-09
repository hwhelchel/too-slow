require 'rails_helper'

RSpec.describe KarmaPoint, type: :model do
  it { is_expected.to belong_to(:user) }

  describe '#valid?' do
    it { is_expected.to validate_presence_of(:user) }

    it { is_expected.to validate_presence_of(:label) }

    it { is_expected.to validate_numericality_of(:value).only_integer }
    it { is_expected.to allow_value(0).for(:value) }
    it { is_expected.to allow_value(1).for(:value) }
    it { is_expected.to_not allow_value(-1).for(:value) }
  end

  describe '#save' do
    let(:user) { create(:user) }

    it "increments the user's total_karma by the value of the karma point" do
      expect {
        create(:karma_point, user: user, value: 10)
      }.to change(user, :total_karma).by(10)
    end
  end
end
