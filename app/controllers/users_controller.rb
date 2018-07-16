class UsersController < ApplicationController

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

  def checkuser
    if params[:phone]
      if User.find_by(phone: params[:phone])
        json_response({ exists: true }, :ok)
      else
        json_response({ exists: false }, :not_found)
      end
    else
      json_response({ error_msg: "Required parameter (phone) is missing" }, :not_found)
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
