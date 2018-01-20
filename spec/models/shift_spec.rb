require "rails_helper"

RSpec.describe Shift, type: :model do

  describe 'Schema' do
    describe 'Fields' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:opening_time).of_type(:time) }
      it { is_expected.to have_db_column(:closing_time).of_type(:time) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:restaurant_id).of_type(:integer).with_options(index: true) }
    end

    describe 'Indices' do
      it { is_expected.to have_db_index(:restaurant_id) }
    end
  end


  describe 'Associations' do
    it { is_expected.to belong_to(:restaurant) }
  end

  describe 'Validations' do
    let(:subject) { create(:shift) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:opening_time) }
    it { is_expected.to validate_presence_of(:closing_time) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:restaurant_id).case_insensitive }

    let(:invalid_shift) { build(:shift, opening_time: Time.current + 2.hours, closing_time: Time.current) }

    it { expect(invalid_shift.valid?).to be_falsey }
  end

end
