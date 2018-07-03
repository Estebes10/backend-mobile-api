# spec/requests/todos_spec.rb
require 'rails_helper'

RSpec.describe 'Solicitudes API', type: :request do

  # inicializar datos de prueba
  # Crear 10 solicitudes
  let!(:requests) { create_list(:request, 10) }

  # Obtener el id de la primer solicitud
  let(:request_id) { requests.first.id }

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
  describe 'GET /requests/:id' do
    before { get "/requests/#{request_id}" }

    context 'cuando el registro pedido existe' do
      it 'regresa la solicitud' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(request_id)
      end

      it 'regresa un código http OK' do
        expect(response).to have_http_status(200)
      end
    end

    context 'cuando el registro no existe' do
      let(:request_id) { 100 }

      it 'retorna un codigo http NOT FOUND' do
        expect(response).to have_http_status(404)
      end

      it 'regresa un mensaje de error' do
        expect(response.body).to match(/Couldn't find Request/)
      end
    end
  end

end
