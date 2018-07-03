require 'rails_helper'

RSpec.describe Request, type: :model do

  subject(:request) do
    # Genera un registro de Solicitud sin guardar
    FactoryBot.build(:request)
  end

  # Valida si el registro es valido con los attributos correctos
  it 'es válido si el nombre, descripción, codigo y estatus son correctos' do
    expect(request).to be_valid
  end

  # Suite de pruebas para validas que los atributos no sean nulos
  it 'no es válido sin un nombre' do
    request.name = nil

    expect(request).not_to be_valid
  end

  it 'no es válido sin un código' do
    request.code = nil

    expect(request).not_to be_valid
  end

  it 'no es válido sin un estatus' do
    request.status = nil

    expect(request).not_to be_valid
  end

  # Pruebas para validar atributos vacios
  it 'es válido sin una descripcion' do
    request.description = nil

    expect(request).to be_valid
  end

  # Suite de pruebas para verificar que los datos no sobrepasan los limites
  it 'no es válido si el nombre tiene más de 64 caracteres' do
    request.name = 'a' * 65

    expect(request).not_to be_valid
  end

  it 'no es válido si el código tiene más de 16 caracteres' do
    request.code = 'a' * 17

    expect(request).not_to be_valid
  end

  it 'no es válido si la descripción tiene más de 1024 caracteres' do
    request.name = 'a' * 1025

    expect(request).not_to be_valid
  end

  # pruebas para validar que el codigo sea único para cada registro
  it 'no es válido si el código ya es usado por otro registro' do
    # Crear un registro previamante e intentar guardar el nuevo registro con el
    # el mismo código
    FactoryBot.create(:request, code: request.code)

    expect(request).not_to be_valid
  end

  # Pruebas para verificar asociaciones con otras tablas
  it { should have_many(:events) }

end
