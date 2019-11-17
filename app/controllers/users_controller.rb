class UsersController < ApplicationController

    get '/signup' do
        redirect '/penguins' if logged_in?
        erb :'/users/new.html'
    end

    post '/users' do
        @user = User.new
        @user.username = params[:username]
        @user.password = params[:password]
        if @user.save
            session[:id] = @user.id
            redirect '/penguins'
        else
            redirect '/signup'
        end
    end

end