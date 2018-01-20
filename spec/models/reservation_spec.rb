require "rails_helper"

RSpec.describe Reservation, type: :model do

  describe 'Schema' do
    describe 'Fields' do
      it { is_expected.to have_db_column(:time).of_type(:datetime) }
      it { is_expected.to have_db_column(:guest_count).of_type(:integer) }
      it { is_expected.to have_db_column(:guest_id).of_type(:integer).with_options(index: true) }
      it { is_expected.to have_db_column(:table_id).of_type(:integer).with_options(index: true) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end
  end

  describe 'Associations' do
    it { is_expected.to have_many(:table) }
    it { is_expected.to have_many(:guest) }
  end

  describe 'Validations' do
    let(:subject) { create(:restaurant) }

    it { is_expected.to validate_presence_of(:time) }
    it { is_expected.to validate_presence_of(:table) }
    it { is_expected.to validate_presence_of(:guest) }
    it { is_expected.to validate_presence_of(:shift) }
    it { is_expected.to validate_numericality_of(:guest_count).only_integer.is_greater_than(0) }

  end


end
