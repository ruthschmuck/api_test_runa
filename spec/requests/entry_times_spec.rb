require 'rails_helper'

RSpec.describe 'Entry Times API', type: :request do
  let!(:user) { create(:user) }
  let!(:entry_times) { create_list(:entry_time, 10, user: user) }
  let(:entry_time_id) { entry_times.first.id }

  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /users/:user_id/entry_times
  describe 'GET /users/:user_id/entry_times' do
    # make HTTP get request before each example
    before { get '/users/:user_id/entry_times', params: {}, headers: headers }

    it 'return entry times' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /users/:user_id/entry_times/:id
  describe 'GET /users/:user_id/entry_times/:id' do
    before do
      get "/users/:user_id/entry_times/#{entry_time_id}",
          params: {},
          headers: headers
    end

    context 'when is admin' do
      context 'when the record exists' do
        it 'returns the entry' do
          expect(JSON.parse(response.body)).not_to be_empty
          expect(JSON.parse(response.body)['id']).to eq(entry_time_id)
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end

      context 'when the record does not exist' do
        let(:entry_time_id) { 100 }

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end

        it 'returns a not found message' do
          expect(response.body).to match("Couldn't find EntryTime")
        end
      end
    end
  end

  # Test suite for POST /users/:user_id/entry_times
  describe 'POST /users/:user_id/entry_times' do
    # send json payload
    let(:valid_attributes) { { recordEntry: '07:30:00' }.to_json }

    context 'when the request is valid' do
      before do
        post '/users/:user_id/entry_times',
             params: valid_attributes,
             headers: headers
      end

      it 'create a entry time' do
        expect(JSON.parse(response.body)['recordEntry']).to eq('07:30:00')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { recordEntry: nil }.to_json }

      before do
        post '/users/:user_id/entry_times',
             params: invalid_attributes,
             headers: headers
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("Validation failed: Recordentry can't be blank")
      end
    end

    context 'when does not admin' do
      let(:user) { create(:user_employee) }
      before do
        post '/users/:user_id/entry_times',
             params: valid_attributes,
             headers: headers
      end
      it 'should return status 422 ' do
        expect(response).to have_http_status(422)
      end
    end
  end

  # Test suite for PUT /users/:user_id/entry_times/:id
  describe 'PUT /users/:user_id/entry_times/:id' do
    let(:valid_attributes) { { recordEntry: '07:30:00' }.to_json }

    context 'when is admin' do
      context 'when record exists' do
        before do
          put "/users/:user_id/entry_times/#{entry_time_id}",
              params: valid_attributes,
              headers: headers
        end

        it 'updates record' do
          expect(response.body).to be_empty
        end

        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
      end

      context 'when record does not exists' do
        let(:entry_time_id) { 100 }

        before do
          put "/users/:user_id/entry_times/#{entry_time_id}",
              params: valid_attributes,
              headers: headers
        end

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end

        it 'returns a not found message' do
          expect(response.body).to match("Couldn't find EntryTime")
        end
      end
    end

    context 'when does not admin' do
      let(:user) { create(:user_employee) }
      before do
        put "/users/:user_id/entry_times/#{entry_time_id}",
             params: valid_attributes,
             headers: headers
      end
      it 'should return status 422 ' do
        expect(response).to have_http_status(422)
      end
    end
  end

  # Test suite for DELETE /users/:user_id/entry_times/:id
  describe 'DELETE /users/:user_id/entry_times/:id' do
    context 'when is admin'
      context 'when record exists' do
        before do
          delete "/users/:user_id/entry_times/#{entry_time_id}",
                 params: {},
                 headers: headers
        end

        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
      end

    context 'when does not admin' do
      let(:user) { create(:user_employee) }
      before do
        delete "/users/:user_id/entry_times/#{entry_time_id}",
               params: {},
               headers: headers
      end
      it 'should return status 422 ' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
