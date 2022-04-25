class Api::V1::AppController < ActionController::Base
    respond_to :json
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    # protect_from_forgery with: :exception
    protect_from_forgery unless: -> { request.format.json? }  
    
    def authenticate_with_token!      
      current_api_user = User.find_by(authentication_token: params[:user_token]) 
      if !current_api_user.present?
        render json: { status: false, message: "Not authenticated request" } 
      end
    end  
end
  