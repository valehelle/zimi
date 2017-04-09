class User < ApplicationRecord
  before_save -> { skip_confirmation! }
  has_friendship
  has_many :user_post
  has_many :post
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end
