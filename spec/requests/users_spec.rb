require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  # test suite for GET /users
  describe 'GET /users' do
    before { get '/users' }

    it 'should return users' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(10)
    end

    it 'should return status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /users/:id
  describe 'GET /users/:id' do
    before { get "/users/#{user_id}" }

    context 'when the record exist' do
      it 'should return the off' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(user_id)
      end

      it 'should return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:user_id) { 100 }

      it 'should return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'should return a not found message' do
        expect(response.body).to match("Couldn't find User")
      end
    end
  end

  # Test suite for POST /users
  describe 'POST /users' do
    let(:valid_attributes) do
      { email: 'myemail@mail.com',
        password_digest: Faker::Internet.password,
        name: Faker::Name.first_name,
        lastName: Faker::Name.first_name,
        docId: Faker::IDNumber.spanish_citizen_number,
        phone: Faker::PhoneNumber.cell_phone,
        address: Faker::Address.full_address,
        admin: 'true' }
    end

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'should create a off time' do
        expect(JSON.parse(response.body)['email']).to eq('myemail@mail.com')
      end

      it 'should return status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before do
        post '/users', params: { email: ' ',
                                 password_digest: Faker::Internet.password,
                                 name: Faker::Name.first_name,
                                 lastName: Faker::Name.first_name,
                                 docId: Faker::IDNumber.spanish_citizen_number,
                                 phone: Faker::PhoneNumber.cell_phone,
                                 address: Faker::Address.full_address,
                                 admin: 'true' }
      end

      it 'should return status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'should return a validation failure message' do
        expect(response.body)
          .to match("Validation failed: Email can't be blank")
      end
    end
  end

  # Test suite for PUT /users/:id
  describe 'PUT /users/:id' do
    let(:valid_attributes) do
      { email: 'myemail@mail.com',
        password_digest: Faker::Internet.password,
        name: Faker::Name.first_name,
        lastName: Faker::Name.first_name,
        docId: Faker::IDNumber.spanish_citizen_number,
        phone: Faker::PhoneNumber.cell_phone,
        address: Faker::Address.full_address,
        admin: 'true' }
    end

    context 'when reord exist' do
      before { put "/users/#{user_id}", params: valid_attributes }

      it 'should update record' do
        expect(response.body).to be_empty
      end

      it 'should return status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context ' when record does not exist' do
      let(:user_id) { 100 }

      before { put "/users/#{user_id}", params: valid_attributes }

      it 'should return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'should return a not found message' do
        expect(response.body).to match("Couldn't find User")
      end
    end
  end

  # Test suite for DELETE /users/:id
  describe 'DELETE /users/:id' do
    context 'when record exists' do
      before { delete "/users/#{user_id}" }
      it 'should returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
