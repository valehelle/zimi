class UserController < ApplicationController
  def update
  end

  def create
    @user = User.find_by_email("hazmii@gmail.com")
    puts "helo"
    puts @user.friends.first.email
  end

end
