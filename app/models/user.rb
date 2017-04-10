class User < ApplicationRecord
  before_create :add_nickname
  has_friendship
  has_many :user_post
  has_many :post
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  private
    def add_nickname
      email = "hazmi"
      name = email.to_s.split('@')[0]
      if User.exists?(nickname: name)
        self.nickname = loop do
          nickname = name + rand(1..1000).to_s
          break nickname unless User.exists?(nickname: nickname)
        end
      end
      self.nickname = nickname
    end
end
