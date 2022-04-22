class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role, class_name: "Role", foreign_key: "role_id"

  validates_presence_of :name, :role_id, message: "can't be blank"
end
