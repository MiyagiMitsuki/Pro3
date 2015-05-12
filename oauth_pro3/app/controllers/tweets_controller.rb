class TweetsController < ApplicationController
    
    def create
        @tweet = Tweet.new
        @tweet.content = params[:tweet][:content]
        @tweet.name = current_user.name
        @tweet.userid = current_user.nickname
        @tweet.userimage = current_user.image
        respond_to do |format|
            if @tweet.save
                @tweets = Tweet.all.reverse_order
                format.js
                else
                render template: "sessions/index"
            end
        end
    end
    
    private
    def tweet_params
        params.permit(:description)
    end
    
end
