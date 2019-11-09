class UsersController < ApplicationController

    get '/signup' do
        erb :'/users/new.html'
    end

    post '/users' do
        @user = User.new
        @user.username = params[:username]
        @user.password = params[:password]
        if @user.save
            session[:username] = @user.username
            redirect '/penguins'
        else
            redirect '/signup'
        end
    end

end