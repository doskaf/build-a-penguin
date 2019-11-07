class PenguinsController < ApplicationController

    get '/penguins' do
        @penguins = Penguin.all
        erb :'/penguins/index.html'
    end

    get '/penguins/new' do
        if !logged_in?
            redirect '/login'
        else
            erb :'penguins/new.html'
        end
    end

    post '/penguins' do
        @penguin = Penguin.new
        @penguin.name = params[:name]
        @penguin.color = params[:color]
        @penguin.headwear = params[:headwear]
        @penguin.clothing = params[:clothing]
        if @penguin.save
            redirect '/penguins'
        else
            redirect '/penguins/new'
        end
    end

    get '/penguins/:id/edit' do
        if !logged_in?
            redirect '/login'
        else
            if penguin = current_user.penguins.find(params[:id])
                erb :'penguins/edit.html'
            else
                redirect '/penguins'
            end
        end
    end

end