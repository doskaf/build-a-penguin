class PenguinsController < ApplicationController

    get '/penguins' do
        "A list of public penguins"
    end

    get '/penguins/new' do
        if !logged_in?
            redirect '/login'
        else
            erb :'penguins/new.html'
        end
    end

    get '/penguins/:id/edit' do
        if !logged_in?
            redirect '/login'
        else
            erb :'penguins/edit.html'
        end
    end

end