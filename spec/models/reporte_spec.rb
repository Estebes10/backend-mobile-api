require 'rails_helper'

RSpec.describe Reporte, type: :model do

  subject(:reporte) do
    # Genera un registro de usuario sin guardar
    FactoryBot.build(:reporte)
  end

  # Valida si el registro es valido con los attributos correctos
  it 'es válido si el folio, fecha, hora, ID de usuario, ID de situación, ' \
     'estatus, descripción y adjuntos son correctos' do
    expect(reporte).to be_valid
  end

  # Suite de pruebas para validas que los atributos no sean nulos
  it 'no es válido sin una fecha' do
    reporte.date = nil

    expect(reporte).not_to be_valid
  end

  it 'no es válido sin una hora de expedición' do
    reporte.hour = nil

    expect(reporte).not_to be_valid
  end

  it 'no es válido sin en el ID de la situación' do
    reporte.situation_id = nil

    expect(reporte).not_to be_valid
  end

  it 'no es válido sin un el estatus de activo' do
    reporte.active = nil

    expect(reporte).not_to be_valid
  end

  it 'no es válido sin la calle del lugar de acontecimiento' do
    reporte.street = nil

    expect(reporte).not_to be_valid
  end

  it 'no es válido sin la colonia del lugar de acontecimiento' do
    reporte.colony = nil

    expect(reporte).not_to be_valid
  end

  # Suite de pruebas para validas que los atributos pueden ser nulos
  it 'es válido sin una descripción' do
    reporte.description = nil

    expect(reporte).to be_valid
  end

  it 'es válido sin adjuntos (imagenes o videos)' do
    reporte.attachments = nil

    expect(reporte).to be_valid
  end

  it 'es válido si no se especifica un usuario' do
    reporte.user_id = nil

    expect(reporte).to be_valid
  end

  it 'es válido si no se especifican posibles involucrados' do
    reporte.people_involved = nil

    expect(reporte).to be_valid
  end

  it 'es válido sin el numero de casa del lugar de acontecimiento' do
    reporte.house_number = nil

    expect(reporte).to be_valid
  end

  it 'es válido sin el código postal del lugar de acontecimiento' do
    reporte.zip_code = nil

    expect(reporte).to be_valid
  end

  it 'es válido si el nombre del solicitante' do
    reporte.requester_name = nil

    expect(reporte).to be_valid
  end

  it 'es válido sin el apellido del solicitante' do
    reporte.requester_lastname = nil

    expect(reporte).to be_valid
  end

  it 'es valido si se agregan varios adjuntos' do
    reporte.attachments = []
    adjunto1 = Faker::Company.logo
    adjunto2 = Faker::Company.logo
    reporte.attachments << adjunto1
    reporte.attachments << adjunto2

    expect(reporte.attachments).to eq([adjunto1, adjunto2])
  end

  it 'es valido si se agregan varias personas involucradas' do
    reporte.people_involved = []
    person1 = {nombre: Faker::Name.name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone }
    person2 = {nombre: Faker::Name.name, lastname: Faker::Name.last_name, phone: Faker::PhoneNumber.cell_phone }
    reporte.people_involved << person1
    reporte.people_involved << person2

    expect(reporte.people_involved).to eq([person1, person2])
  end

end
