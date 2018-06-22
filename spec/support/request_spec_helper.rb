module RequestSpecHelper
  # Método de ayuda para parsear una respuesta JSON a un Hash de ruby
  def json
    JSON.parse(response.body)
  end

end
