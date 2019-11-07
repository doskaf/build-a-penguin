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
        @penguin.user_id = current_user.id
        if @penguin.save
            redirect '/penguins'
        else
            redirect '/penguins/new'
        end
    end

    get '/penguins/:id' do
        if !logged_in?
            redirect to '/login'
        else
            if @penguin = current_user.penguins.find(params[:id])
                erb :'penguins/show.html'
            else
                redirect '/penguins'
            end
        end
    end

    get '/penguins/:id/edit' do
        if !logged_in?
            redirect '/login'
        else
            if @penguin = current_user.penguins.find(params[:id])
                erb :'penguins/edit.html'
            else
                redirect '/penguins'
            end
        end
    end

    patch '/penguins/:id' do
        @penguin = Penguin.find(params[:id])
        @penguin.update(:name => params[:name], :color => params[:color], :headwear => params[:headwear], :clothing => params[:clothing])
        @penguin.save
        redirect "/penguins/#{@penguin.id}"
    end

    delete '/penguins/:id/delete' do
        if !logged_in?
            redirect '/login'
        else
            if @penguin = current_user.penguins.find(params[:id])
                @penguin.delete
                redirect '/penguins'
            end
            #redirect '/penguins'
        end
    end

end