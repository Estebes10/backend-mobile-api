# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Solicitudes API', type: :request do

  # inicializar datos de prueba
  # Crear 10 solicitudes
  let!(:requests) { create_list(:request, 10) }

  # Obtener el id de la primer solicitud
  let(:request_code) { requests.first.code }
  let(:false_code) { '12389123891' }

  # Conjunto de pruebas para GET /requets
  describe 'GET /requets' do

    # make HTTP get request before each example
    before { get '/requests' }

    it 'regresa los tipos de solicitudes registradas' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'regresa un codigo http OK' do
      expect(response).to have_http_status(200)
    end
  end

  # Conjunto de pruebas para Obtener una solicitud GET /requests/:id
  describe 'GET /requests/:request_code' do

    context 'cuando el registro pedido existe' do
      before { get "/requests/#{request_code}" }

      it 'regresa la solicitud' do
        expect(json).not_to be_empty
        expect(json['code']).to eq(request_code)
      end

      it 'regresa un código http OK' do
        expect(response).to have_http_status(200)
      end
    end

    context 'cuando el registro no existe' do

      before { get "/requests/#{false_code}" }

      it 'retorna un codigo http NOT FOUND' do
        expect(response).to have_http_status(404)
      end

      it 'regresa un mensaje de error' do
        expect(response.body).to match(/Couldn't find Request/)
      end
    end
  end

end
