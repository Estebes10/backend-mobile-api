require 'rails_helper'

RSpec.describe 'API tipos de eventos', type: :request do

  # inicializar datos de prueba
  let!(:request) { create(:request) }

  let(:code) { request.code }

  let!(:events) { create_list(:event, 20, request_id: request.id) }

  let(:event_code) { events.first.code }

  # Conjunto de pruebas para GET /requests/:code/events
  # Retorna todos los tipos de eventos por cada solicitud
  describe 'GET /requests/:code/events' do
    before { get "/requests/#{code}/events" }

    context 'cuando existe el tipo de evento' do
      it 'retorn un código http OK' do
        expect(response).to have_http_status(200)
      end

      it 'retorna todos los eventos de la solicitud' do
        expect(json.size).to eq(20)
      end
    end

    context 'cuando no existe el tipo de solicitud' do
      let(:code) { 'ADLLLL' }

      it 'retorna un codigo http NOT FOUND' do
        expect(response).to have_http_status(404)
      end

      it 'retorna un mensage de no encontrado' do
        expect(response.body).to match(/Couldn't find Request/)
      end
    end
  end

  # Conjunto de pruebas para GET /requets/:request_id/events/:id
  # retorna un tipo de evento de acuerdo al tipo de solicitud
  describe 'GET /requests/:code/events/:event_code' do

    before { get "/requests/#{code}/events/#{event_code}" }

    context 'cuando el evento existe' do
      it 'retorna un codigo http OK' do
        expect(response).to have_http_status(200)
      end

      it 'regresa el tipo de evento pedido' do
        expect(json['code']).to eq(event_code)
      end
    end

    context 'cuando el evento no existe' do
      let(:event_code) { '123899' }

      it 'retorna un código http NOT FOUND' do
        expect(response).to have_http_status(404)
      end

      it 'retorna un mensage de no encontrado' do
        expect(response.body).to match(/Couldn't find Event/)
      end
    end
  end

end
