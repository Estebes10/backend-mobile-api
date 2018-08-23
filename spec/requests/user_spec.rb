# spec/requests/situations_spec.rb
require 'rails_helper'

RSpec.describe 'Usuario API', type: :request do

  # Create a user test
  let(:user) { build(:user) }

  # create valid attributes for signup
  let(:valid_attributes) do

    # Use the attributes for a user and password_confirmation too
    attributes_for(:user)
  end

  describe 'POST /register' do
    # valid payload

    context 'cuando la petición es válida' do
      # Get the total of user before to do request
      before_count = User.count

      before { post '/register', params: valid_attributes }

      it 'crea un nuevo usuario' do
        expect(User.count).not_to eq(before_count)
      end

      it 'retorna un codigo http CREATED' do
        expect(response).to have_http_status(201)
      end

      it 'retorna un mensaje de exito' do
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'guarda el nombre del usuario' do
        expect(json['user']['name']).to eq(valid_attributes[:name])
      end

      it 'guarda el apellido del usuario' do
        expect(json['user']['lastname']).to eq(valid_attributes[:lastname])
      end

      it 'guarda el telefono del usuario' do
        expect(json['user']['phone']).to eq(valid_attributes[:phone])
      end

      it 'guarda el correo electrónico del usuario' do
        expect(json['user']['email']).to eq(valid_attributes[:email])
      end

    end

    context 'cuando la petición no es correcta' do
      # Get the total of user before to do request
      before_count = User.count

      before { post '/register', params: { name: 'Foobar' } }

      it 'no crea un usuario nuevo' do
        expect(User.count).to eq(before_count)
      end

      it 'retorna un mensaje de error UNPROCESSABLE ENTITY' do
        expect(response).to have_http_status(422)
      end

      it 'retorna un mensaje de error' do
        expect(json['message'])
          .to match(/Validation failed: Lastname can't be blank, Email can't be blank, Phone can't be blank/)
      end

    end

  end

  describe 'POST /checkuser' do

    before(:each) do
      @user = FactoryBot.create(:user)
    end

    context 'cuando el usuario existe' do

      before { post '/checkuser', params: { phone: @user.phone } }

      it 'retorna un codigo http OK' do
        expect(response).to have_http_status(200)
      end

      it 'retorna un mensaje de exito' do
        expect(json['exists'])
          .to eq(true)
      end

    end

    context 'cuando el usuario no existe' do

      before(:each) do
        User.destroy_all
      end

      before { post '/checkuser', params: { phone: user.phone } }

      it 'retorna un codigo http NOT FOUND' do
        expect(response).to have_http_status(404)
      end

      it 'retorna un mensaje de error' do
        expect(json['exists'])
          .to eq(false)
      end

    end

    context 'cuando se realiza la petición sin el número telefónico' do

      before { post '/checkuser', params: nil }

      it 'retorna un codigo http NOT FOUND' do
        expect(response).to have_http_status(404)
      end

      it 'retorna un mensaje de error' do
        expect(json['error_msg'])
          .to match("Required parameter (phone) is missing")
      end

    end

  end

  describe 'POST getuser' do

    before(:each) do
      @user = FactoryBot.create(:user)
    end

    context 'cuando el usuario existe' do

      before { post '/getuser', params: { phone: @user.phone } }

      it 'retorna un codigo http OK' do
        expect(response).to have_http_status(200)
      end

      it 'retorna el nombre del usuario' do
        expect(json['name']).to eq(@user.name)
      end

      it 'retorna el apellido del usuario' do
        expect(json['lastname']).to eq(@user.lastname)
      end

      it 'retorna el telefono del usuario' do
        expect(json['phone']).to eq(@user.phone)
      end

      it 'retorna el correo del usuario' do
        expect(json['email']).to eq(@user.email)
      end

    end

    context 'cuando el usuario no existe' do

      before(:each) do
        User.destroy_all
      end

      before { post '/getuser', params: { phone: user.phone } }

      it 'retorna un codigo http NOT FOUND' do
        expect(response).to have_http_status(404)
      end

      it 'retorna un mensaje de error' do
        expect(json['error_msg'])
          .to eq("User does not exists")
      end

    end

    context 'cuando se realiza la petición sin el número telefónico' do

      before { post '/getuser', params: nil }

      it 'retorna un codigo http NOT FOUND' do
        expect(response).to have_http_status(404)
      end

      it 'retorna un mensaje de error' do
        expect(json['error_msg'])
          .to match("Required parameter (phone) is missing")
      end

    end

  end

end
