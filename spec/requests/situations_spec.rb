# spec/requests/situations_spec.rb
require 'rails_helper'

RSpec.describe 'Situaciones API', type: :request do

  # inicializar datos de prueba
  let!(:request) { create(:request) }

  let(:code) { request.code }

  let!(:events) { create_list(:event, 20, request_id: request.id) }

  let(:event_code) { events.first.code }

  let!(:situations) { create_list(:situation, 20, event_id: events.first.id) }

  let(:id) { situations.first.id }

  # Conjunto de pruebas para GET /situations
  describe 'GET /requests/:code/events/:event_code/situations' do

    # make HTTP get request before each example
    before { get "/requests/#{code}/events/#{event_code}/situations" }

    it 'regresa los tipos de situaciones registradas' do
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'regresa un codigo http OK' do
      expect(response).to have_http_status(200)
    end
  end

  # Conjunto de pruebas para Obtener una solicitud GET /requests/:id
  describe 'GET /requests/:code/events/:event_code/situations/:id' do
    before { get "/requests/#{code}/events/#{event_code}/situations/#{id}" }

    context 'cuando el registro pedido existe' do
      it 'regresa la situacion' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end

      it 'regresa un código http OK' do
        expect(response).to have_http_status(200)
      end
    end

    context 'cuando el registro no existe' do
      let(:id) { 0 }

      it 'retorna un codigo http NOT FOUND' do
        expect(response).to have_http_status(404)
      end

      it 'regresa un mensaje de error' do
        expect(response.body).to match(/Couldn't find Situation/)
      end
    end
  end

end
