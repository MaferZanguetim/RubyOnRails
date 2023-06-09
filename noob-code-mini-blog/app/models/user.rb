class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable,
          :registerable,
          :confirmable,
          :recoverable, 
          :rememberable,
          :trackable,
          :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :posts
  has_many :comments

end