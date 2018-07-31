require 'rails_helper'

RSpec.describe 'API tipos de reportes', type: :request do

  # Suite de pruebas para guardar un nuevo reporte
  describe 'POST /reportes' do
    # valid payload
    before(:each) do
      @valid_attributes = {
        date: Time.zone.now.strftime("%Y-%m-%d"),
        hour: Time.now.strftime("%H:%M:%S"),
        description: "Robo en casa habitación",
        attachments: [""],
        folio: '0000001',
        user_id: nil,
        situation_id: 1,
        street: Faker::Address.street_name,
        zip_code: Faker::Address.zip_code,
        colony: Faker::Address.city,
        requester_name: Faker::Name.first_name,
        requester_lastname: Faker::Name.last_name,
        people_involved: [""]
      }
    end

    context 'cuando la petición es válida' do

      context 'con todos los atributos' do

        before { post '/reportes', params: @valid_attributes }

        it 'crea un reporte con la fecha dada' do
          expect(json['date']).to eq(@valid_attributes[:date])
        end

        it 'crea un reporte con la hora dada' do
          expect(json['hour']).to eq(@valid_attributes[:hour])
        end

        it 'crea un reporte con la descripción dada' do
          expect(json['description']).to eq(@valid_attributes[:description])
        end

        it 'crea un reporte con los adjuntos dados' do
          expect(json['attachments']).to eq(@valid_attributes[:attachments])
        end

        it 'crea un reporte con el ID del usuario dado' do
          expect(json['user_id']).to eq(@valid_attributes[:user_id])
        end

        it 'crea un reporte con el ID de la situación dada' do
          expect(json['situation_id']).to eq(@valid_attributes[:situation_id])
        end

        it 'crea un reporte con la dirección de la solicitud' do
          expect(json['place']).to eq(@valid_attributes[:place])
        end

        it 'retorna un código http CREATED' do
          expect(response).to have_http_status(201)
        end

      end

      context 'sin los atributos obligatorios' do
        before { @valid_attributes[:user_id] = nil }

        before { post '/reportes', params: @valid_attributes }

        it 'retorna un código http CREATED' do
          expect(response).to have_http_status(201)
        end
      end

    end

    context 'cuando la petición no es válida' do

      context 'por la falta de la fecha' do

        before { @valid_attributes[:date] = nil }

        before { post '/reportes', params: @valid_attributes }

        it 'retorna un codigo de error UNPROCCESSABLE ENTITY' do
          expect(response).to have_http_status(422)
        end

        it 'retorna un mensaje de error' do
          expect(response.body)
            .to match(/Validation failed: Date can't be blank/)
        end

      end

      context 'por la falta de la hora' do

        before { @valid_attributes[:hour] = nil }

        before { post '/reportes', params: @valid_attributes }

        it 'retorna un codigo de error UNPROCCESSABLE ENTITY' do
          expect(response).to have_http_status(422)
        end

        it 'retorna un mensaje de error' do
          expect(response.body)
            .to match(/Validation failed: Hour can't be blank/)
        end

      end

      context 'por la falta de la descripción' do

        before { @valid_attributes[:description] = nil }

        before { post '/reportes', params: @valid_attributes }

        it 'retorna un codigo de error UNPROCCESSABLE ENTITY' do
          expect(response).to have_http_status(422)
        end

        it 'retorna un mensaje de error' do
          expect(response.body)
            .to match(/Validation failed: Description can't be blank/)
        end

      end

      context 'por la falta del folio' do

        before { @valid_attributes[:folio] = nil }

        before { post '/reportes', params: @valid_attributes }

        it 'retorna un codigo de error UNPROCCESSABLE ENTITY' do
          expect(response).to have_http_status(422)
        end

        it 'retorna un mensaje de error' do
          expect(response.body)
            .to match(/Validation failed: Folio can't be blank/)
        end

      end

      context 'por la falta del ID de la situación' do

        before { @valid_attributes[:situation_id] = nil }

        before { post '/reportes', params: @valid_attributes }

        it 'retorna un codigo de error UNPROCCESSABLE ENTITY' do
          expect(response).to have_http_status(422)
        end

        it 'retorna un mensaje de error' do
          expect(response.body)
            .to match(/Validation failed: Situation can't be blank/)
        end

      end

      context 'por la falta de la calle del lugar de la solicitud' do

        before { @valid_attributes[:street] = nil }

        before { post '/reportes', params: @valid_attributes }

        it 'retorna un codigo de error UNPROCCESSABLE ENTITY' do
          expect(response).to have_http_status(422)
        end

        it 'retorna un mensaje de error' do
          expect(response.body)
            .to match(/Validation failed: Street can't be blank/)
        end

      end

      context 'por la falta de la colonia del lugar de la solicitud' do

        before { @valid_attributes[:colony] = nil }

        before { post '/reportes', params: @valid_attributes }

        it 'retorna un codigo de error UNPROCCESSABLE ENTITY' do
          expect(response).to have_http_status(422)
        end

        it 'retorna un mensaje de error' do
          expect(response.body)
            .to match(/Validation failed: Colony can't be blank/)
        end

      end

      context 'por la falta de la calle del lugar de la solicitud' do

        before { @valid_attributes[:zip_code] = nil }

        before { post '/reportes', params: @valid_attributes }

        it 'retorna un codigo de error UNPROCCESSABLE ENTITY' do
          expect(response).to have_http_status(422)
        end

        it 'retorna un mensaje de error' do
          expect(response.body)
            .to match(/Validation failed: Zip code can't be blank/)
        end

      end

      context 'por la falta de la calle del lugar de la solicitud' do

        before { @valid_attributes[:requester_name] = nil }

        before { post '/reportes', params: @valid_attributes }

        it 'retorna un codigo de error UNPROCCESSABLE ENTITY' do
          expect(response).to have_http_status(422)
        end

        it 'retorna un mensaje de error' do
          expect(response.body)
            .to match(/Validation failed: Requester name can't be blank/)
        end

      end

      context 'por la falta de la calle del lugar de la solicitud' do

        before { @valid_attributes[:requester_lastname] = nil }

        before { post '/reportes', params: @valid_attributes }

        it 'retorna un codigo de error UNPROCCESSABLE ENTITY' do
          expect(response).to have_http_status(422)
        end

        it 'retorna un mensaje de error' do
          expect(response.body)
            .to match(/Validation failed: Requester lastname can't be blank/)
        end

      end

    end

  end

end
