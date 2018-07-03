require 'rails_helper'

RSpec.describe Situation, type: :model do

  subject(:situation) do
    # Genera un registro de evento sin guardar
    FactoryBot.build(:situation)
  end

  # Valida si el registro es valido con los attributos correctos
  it 'es válido si el nombre, descripción, codigo, instantáneo y estatus son ' \
     'correctos' do
    expect(situation).to be_valid
  end

  # Suite de pruebas para validas que los atributos no sean nulos
  it 'no es válido sin un nombre' do
    situation.name = nil

    expect(situation).not_to be_valid
  end

  it 'no es válido sin un codigo' do
    situation.code = nil

    expect(situation).not_to be_valid
  end

  it 'no es válido sin un estatus' do
    situation.status = nil

    expect(situation).not_to be_valid
  end

  it 'no es válido si no se especifica si es un evento instantáneo' do
    situation.instantaneous = nil

    expect(situation).not_to be_valid
  end

  # Suite de pruebas para verificar que los datos no sobrepasan los limites
  it 'no es válido si el nombre tiene más de 128 caracteres' do
    situation.name = 'a' * 129

    expect(situation).not_to be_valid
  end

  it 'no es válido si el codigo tiene más de 16 caracteres' do
    situation.code = 'a' * 17

    expect(situation).not_to be_valid
  end

  it 'no es válido si la descripcion de la situación tiene más de 1024 ' \
     'caracteres' do
    situation.description = 'a' * 1025

    expect(situation).not_to be_valid
  end

  # pruebas para validar que el codigo sea único para cada registro
  it 'no es válido si el código ya es usado por otro registro' do
    # Crear un registro previamante e intentar guardar el nuevo registro con el
    # el mismo código
    FactoryBot.create(:situation, code: situation.code)

    expect(situation).not_to be_valid
  end

  # Pruebas para verificar asociaciones con otras tablas
  # Asociacion 1 - N con evento
  it { should belong_to(:event) }

end
