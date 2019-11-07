class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login.html"
    end

    post '/sessions' do
        login(params[:username])
        redirect '/penguins'
    end

    get '/logout' do
        session.clear
        redirect '/penguins'
    end

end