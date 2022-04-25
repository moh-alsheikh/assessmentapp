class Api::V1::SessionsController < Api::V1::AppController

  def create 
    user_email = params[:email]
    user_password = params[:password]
    
    user = user_email.present? && User.find_by(email: user_email) 

    if (user.valid_password?(user_password))
      sign_in user, store: false
      user.generate_authentication_token!
      user.save            
      render json: user, status: 200
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end 
  end
  

  def destroy
    user = User.find_by(authentication_token: params[:user_token])    
    if user.present?
      user.generate_authentication_token!
      user.save
      head 204
    else
      render json: { errors: "Invalid token" }, status: 422
    end
  end
  
    
end