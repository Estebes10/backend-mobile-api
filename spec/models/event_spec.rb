require 'rails_helper'

RSpec.describe Event, type: :model do

  subject(:event) do
    # Genera un registro de evento sin guardar
    FactoryBot.build(:event)
  end

  # Valida si el registro es valido con los attributos correctos
  it 'es válido si el nombre, descripción, codigo y estatus son correctos' do
    expect(event).to be_valid
  end

  # Suite de pruebas para validas que los atributos no sean nulos
  it 'no es válido sin un nombre' do
    event.name = nil

    expect(event).not_to be_valid
  end

  it 'no es válido sin un código' do
    event.code = nil

    expect(event).not_to be_valid
  end

  it 'no es válido sin un estatus' do
    event.status = nil

    expect(event).not_to be_valid
  end

  # Pruebas para validar atributos vacios
  it 'es válido sin una descripción' do
    event.description = nil

    expect(event).to be_valid
  end

  # Suite de pruebas para verificar que los datos no sobrepasan los limites
  it 'no es válido si el nombre tiene más de 64 caracteres' do
    event.name = 'a' * 129

    expect(event).not_to be_valid
  end

  it 'no es válido si el código tiene más de 16 caracteres' do
    event.code = 'a' * 17

    expect(event).not_to be_valid
  end

  it 'no es válido si la descripción tiene más de 1024 caracteres' do
    event.name = 'a' * 1025

    expect(event).not_to be_valid
  end

  # pruebas para validar que el codigo sea único para cada registro
  it 'no es válido si el código ya es usado por otro registro' do
    # Crear un registro previamante e intentar guardar el nuevo registro con el
    # el mismo código
    FactoryBot.create(:event, code: event.code)

    expect(event).not_to be_valid
  end

  # Pruebas para verificar asociaciones con otras tablas
  it { should belong_to(:request) }

  it ' tiene asociado varias tipos de eventos'

end
