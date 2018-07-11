require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    # Genera un registro de usuario sin guardar
    FactoryBot.build(:user)
  end

  # Valida si el registro es valido con los attributos correctos
  it 'es válido si el nombre, apellido, telefono, correo y dirección son ' \
     'correctos' do
    expect(user).to be_valid
  end

  # Suite de pruebas para validas que los atributos no sean nulos
  it 'no es válido sin un nombre' do
    user.name = nil

    expect(user).not_to be_valid
  end

  it 'no es válido sin un apellido' do
    user.lastname = nil

    expect(user).not_to be_valid
  end

  it 'no es válido sin un número telefónico' do
    user.phone = nil

    expect(user).not_to be_valid
  end

  it 'no es válido sin un correo electrónico' do
    user.email = nil

    expect(user).not_to be_valid
  end

  it 'no es válido sin una dirección' do
    user.address = nil

    expect(user).not_to be_valid
  end

  # Suite de pruebas para verificar que los datos no sobrepasan los limites
  it 'no es válido si el nombre tiene más de 128 caracteres' do
    user.name = 'a' * 129

    expect(user).not_to be_valid
  end

  it 'no es válido si el apellido tiene más de 128 caracteres' do
    user.lastname = 'a' * 129

    expect(user).not_to be_valid
  end

  it 'no es válido si el correo tiene más de 128 caracteres' do
    user.email = 'a' * 129

    expect(user).not_to be_valid
  end

  it 'no es válido si el nombre tiene más de 32 caracteres' do
    user.phone = 'a' * 33

    expect(user).not_to be_valid
  end

  it 'no es válido si el nombre tiene más de 256 caracteres' do
    user.email = 'a' * 257

    expect(user).not_to be_valid
  end

  # pruebas para validar que el codigo sea único para cada registro
  it 'no es válido si el número telefonico ya es usado por otro registro' do
    # Crear un registro previamante e intentar guardar el nuevo registro con el
    # el mismo código
    FactoryBot.create(:user, phone: user.phone)

    expect(user).not_to be_valid
  end

  it 'no es válido si el correo electrónico ya es usado por otro registro' do
    # Crear un registro previamante e intentar guardar el nuevo registro con el
    # el mismo código
    FactoryBot.create(:user, email: user.email)

    expect(user).not_to be_valid
  end

end
