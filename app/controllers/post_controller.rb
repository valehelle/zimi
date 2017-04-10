class PostController < ApplicationController
    before_action :authenticate_user!
    def create
        @post = Post.new(text: params[:text],post_type: params[:type])
        @post.author = current_user.id
        if @post.save
            expiry  = (@post.created_at + 6.hours).to_datetime

            if current_user.friends.exists?
                @friends = current_user.friends
                @friends.each do |friend|
                    @userpost = friend.user_post.new(post_id: @post.id,expiry: expiry)
                    @userpost.save
                end
            end

            @userpost = current_user.user_post.new(post_id: @post.id,expiry: expiry)
            if @userpost.save
                render :json => { :status => "success",
                                  :post => @post.as_json(:only => [:id, :text, :post_type],
                                                              :include => {
                                                                      :user => { 
                                                                          :only => [
                                                                              :email, :nickname
                                                                              ]
                                                                          }
                                                              })
                }
            end
        end
    end

    def index
        max_post = 20
        if params[:since_id].present?
            #Get the latest post
            @posts = current_user.user_post.where("id >= ? AND ? <= expiry ", params[:since_id],DateTime.now).limit(max_post).reverse_order
        else
            #Get the previous post
            @posts = current_user.user_post.where("id <= ? AND ? <= expiry ", params[:max_id],DateTime.now).limit(max_post).reverse_order
        end
        render :json => @posts.to_json(:only => [:id],
                                       :include => {:post => {
                                                        :only => [:id, :text, :post_type],
                                                        :include => {
                                                            :user => { 
                                                                :only => [
                                                                    :email, :nickname
                                                                    ]
                                                                }
                                                            }
                                                        }
                                                    })
    end
end
