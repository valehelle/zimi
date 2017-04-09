class RelationshipController < ApplicationController
    before_action :authenticate_user!
    def friend_request
        current_user.friend_request(params[:email])
    end
    def accept_request
        current_user.accept_request(params[:email])
    end
    def decline_request
        current_user.decline_request(params[:email])
    end
    def friend_removed
        @removed_friends = current_user.remove_friend(params[:email])
    end
    def requested_friends
        @requested_friends = current_user.requested_friends
    end
    def friends
        @friends = current_user.friends
        render :json => @friends
    end
end
