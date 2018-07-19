class UsersController < ApplicationController

  #*
   # Endpoint : http.//<domain>/getuser
   # Method : POST
   # Params : Phone
   # Result : JSON
  #*
  def getuser
    if params[:phone]
      if User.find_by(phone: params[:phone])
        @user = User.find_by(phone: params[:phone])
        #msg = {@user}
        render :json => @user
        #json_response({ exists: true }, :ok)
      else
        msg = {:error_msg => "User does not exists"}
        render :json => msg
      end
    else
      msg = {:error_msg => "Required parameter (phone) is missing"}
      render :json => msg
      #json_response({ error_msg: "Required parameter (phone) is missing" }, :not_found)
    end
  end

  #*
   # Endpoint : http.//<domain>/register
   # Method : POST
   # Params : Phone, Name, Lastname, Email and Address
   # Result : JSON
  #*
  def register
    if user_params
      if User.find_by(phone: user_params[:phone])
        json_response({ error_msg: 'User already exists with phone: '+user_params[:phone] }, :not_acceptable)
      else
        @user = User.create!(user_params)
        if @user
          response = { user: @user, message: Message.account_created }
          json_response(response, :created)
        else
          json_response({ error_msg: 'Unknown error occurred' }, :unprocessable_entity)
        end
      end
    else
      json_response({ error_msg: 'Required parameters: '+user_params + ' are missing' }, :not_found)
    end
  end

  #*
   # Endpoint : http.//<domain>/checkuser
   # Method : POST
   # Params : Phone
   # Result : JSON
  #*
  def checkuser
    if params[:phone]
      if User.find_by(phone: params[:phone])
        msg = {:exists => true}
        render :json => msg
        #json_response({ exists: true }, :ok)
      else
        msg = {:exists => false}
        render :json => msg
        #json_response({ exists: false }, :not_found)
      end
    else
      msg = {:error_msg => "Required parameter (phone) is missing"}
      render :json => msg
      #json_response({ error_msg: "Required parameter (phone) is missing" }, :not_found)
    end
  end

  private

  def user_params
    params.permit(
      :name,
      :lastname,
      :email,
      :phone,
      :address
    )
  end

end
