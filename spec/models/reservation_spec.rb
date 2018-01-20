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
    it { is_expected.to belong_to(:table) }
    it { is_expected.to belong_to(:guest) }
  end

  describe 'Validations' do
    let!(:guest) { create(:guest) }
    let!(:shift) { create(:shift, opening_time: "9 AM", closing_time: "12 PM") }
    let!(:restaurant) { shift.restaurant }
    let!(:table) { create(:table, restaurant: restaurant) }
    let!(:subject) { create(:reservation, guest: guest, table: table, time: "12-08-2056 11 AM") }

    it { is_expected.to validate_presence_of(:time) }
    it { is_expected.to validate_presence_of(:table) }
    it { is_expected.to validate_presence_of(:guest) }
    it { is_expected.to validate_presence_of(:shift) }
    it { is_expected.to validate_numericality_of(:guest_count).only_integer.is_greater_than(0) }

    describe "when time is of past" do
      let(:reservation) { build(:reservation, guest: guest, table: table, time: "12-08-2009 11 AM") }
      it "return false" do
        expect(reservation.valid?).to be false
      end
    end

    describe "when guest count is not valid" do
      let(:reservation) { build(:reservation, guest: guest, table: table, time: "12-08-2059 11 AM", guest_count: 100) }
      it "return false" do
        reservation.valid?
        expect(reservation.errors[:guest_count]).to eq(["Invalid Guest Number!!"])
      end
    end
  end

end
