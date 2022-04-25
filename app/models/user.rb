class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         belongs_to :role, class_name: "Role", foreign_key: "role_id"

  validates_presence_of :name, :role_id, message: "can't be blank"

  def self.valid_login?(email, password)
    user = User.find_for_authentication(:email => email)
    user&.valid_password?(password) ? true : false
  end

  def generate_authentication_token!
    begin
      self.authentication_token = Devise.friendly_token
    end while self.class.exists?(authentication_token: authentication_token)
  end

end
