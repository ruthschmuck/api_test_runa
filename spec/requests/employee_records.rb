require 'rails_helper'

RSpec.describe 'Employee Records API', type: :request do
  let!(:user) { create(:user) }
  let!(:entries) { create_list(:entry_time, 10, user: user) }
  let!(:offs) { create_list(:off_time, 10, user: user) }

  # Test suit for GET /employee_records
  describe 'GET /employee_records' do
    before { get '/employee_records' }

    it 'should return record list' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(10)
    end
  end
end
