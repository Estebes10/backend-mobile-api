class ApplicationController < ActionController::API

  # Incluir manejadores en todos los controladores
  include Response
  include ExceptionHandler

end
