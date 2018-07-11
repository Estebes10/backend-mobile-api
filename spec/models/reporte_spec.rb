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

  it 'no es válido sin una descripción' do
    reporte.description = nil

    expect(reporte).not_to be_valid
  end

  it 'no es válido sin un folio' do
    reporte.folio = nil

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

  # Suite de pruebas para validas que los atributos pueden ser nulos
  it 'es válido sin adjuntos (imagenes o videos)' do
    reporte.attachments = nil

    expect(reporte).to be_valid
  end

  it 'es válido si no se especifica un usuario' do
    reporte.user_id = nil

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

  # pruebas para validar que el folio sea único para cada registro
  it 'no es válido si el folio ya es usado por otro registro' do
    # Crear un registro previamante e intentar guardar el nuevo registro con el
    # el mismo folio
    FactoryBot.create(:reporte, folio: reporte.folio)

    expect(reporte).not_to be_valid
  end

end
