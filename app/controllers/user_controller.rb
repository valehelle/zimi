class UserController < ApplicationController
  def update
  end

  def create
    @user = User.new(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
    if @user.save
      render :json => {:success => "True", :user => @user}
    else
      render :json => { :success => "False",:errors => @user.errors.full_messages }
    end
  end

end
