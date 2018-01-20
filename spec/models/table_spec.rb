require "rails_helper"

RSpec.describe Table, type: :model do

  describe 'Schema' do
    describe 'Fields' do
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to have_db_column(:max_guest).of_type(:integer) }
      it { is_expected.to have_db_column(:min_guest).of_type(:integer) }
      it { is_expected.to have_db_column(:restaurant_id).of_type(:integer).with_options(index: true) }
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
    end

    describe 'Indices' do
      it { is_expected.to have_db_index(:restaurant_id) }
    end
  end


  describe 'Associations' do
    it { is_expected.to belong_to(:restaurant) }
  end

  describe 'Validations' do
    let(:subject) { create(:table) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:min_guest).only_integer.is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:max_guest).only_integer.is_greater_than(subject.min_guest) }
  end

end
