class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "pingu"
    end

    helpers do

        def logged_in?
            !!current_user
        end

        def current_user
            @current_user ||= User.find_by(:id => session[:id]) if session[:id]
        end

        def login(username, password)
            user = User.find_by(:username => username)
            if  user && user.authenticate(password)
                session[:id] = user.id
            else
                redirect '/login'
            end
        end

        def authenticate
            redirect "/login" if !logged_in?
        end

        def authorize(penguin)
            redirect "/penguins" if !penguin || (penguin.user != current_user)
            #redirect "/penguins" if penguin.user != current_user
        end


    end

end