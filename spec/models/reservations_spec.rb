require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context 'Table reservation same time' do
    let!(:time_1) { create(:reservation) }
    let!(:time_2) { build(:reservation) }
    it 'cant reserve one table for same time' do
      time_2.save
      expect(time_2.errors.messages[:table_number]).to eq(["Table ##{time_2.table_number} is already reserved for that time"])
    end
  end

  context 'Table reservation wrong time' do
    let!(:time_1) { build(:reservation, start_time: Time.now - 60 * 60) }
    it 'cant reserve table for past time' do
      time_1.save
      expect(time_1.errors.messages[:start_time]).to eq(["I believe in your force young jedi, but you can't reserve table for past time"])
    end
  end

  context 'End time is smaller than start time' do
    let!(:time_1) { build(:reservation, end_time: Time.now - 60 * 60) }
    it 'cant have end time smaller than start time' do
      time_1.save
      expect(time_1.errors.messages[:start_time]).to eq(["Start time can't be greater or equal end time"])
    end
  end
end

