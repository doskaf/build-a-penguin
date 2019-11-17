class SessionsController < ApplicationController

    get '/' do
        erb :"sessions/home.html"
    end
    
    get '/login' do
        redirect '/penguins' if logged_in?
        erb :"sessions/login.html"
    end

    post '/sessions' do
        login(params[:username], params[:password])
        redirect '/penguins'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end