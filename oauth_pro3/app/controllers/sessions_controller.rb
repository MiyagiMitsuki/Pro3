class SessionsController < ApplicationController
    def callback
        auth = request.env["omniauth.auth"]
        user = User.find_by(provider: auth["provider"], uid: auth["uid"],name: auth["info"]["name"],image: auth["info"]["image"],nickname: auth["info"]["nickname"]) || User.create_with_omniauth(auth)
        
        session[:user_id] = user.id
        redirect_to root_url, :notice => "ログイン"
        
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_url, :notice => "ログアウト"
    end
    
    def index
        @tweets = Tweet.all.reverse_order
    end
    
end
