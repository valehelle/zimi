class PostController < ApplicationController
    before_action :authenticate_user!
    def create
        @post = Post.new(text: params[:text])
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
                puts "DONE"
            end
        end
    end
    def index
        @posts = current_user.user_post
        puts @posts.first.post.user.email
        render :json => @posts.to_json(:include => {:post => {
                                                        :include => {
                                                            :user => { 
                                                                :only => [
                                                                    :email , :nickname
                                                                    ]
                                                                }
                                                            }
                                                        }
                                                    })
    end
end
