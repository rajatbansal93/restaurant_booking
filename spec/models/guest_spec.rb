require "rails_helper"

RSpec.describe Guest, type: :model do

  describe 'Schema' do
    describe 'Fields' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:email).of_type(:string) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end


  describe 'Associations' do
    it { is_expected.to have_many(:reservations).dependent(:destroy) }
  end

  describe 'Validations' do
    let(:subject) { create(:guest) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).allow_blank.case_insensitive }
    it { is_expected.to allow_value("abcd@bde.com").for(:email) }
    it { is_expected.not_to allow_value("!@#{}@").for(:email) }
  end
end
