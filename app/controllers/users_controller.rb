class UsersController < ApplicationController

    # users can sign up 
    get '/signup' do 
        erb :'users/signup'
    end

    post '/signup' do 
        user = User.new(params)
        if user.username.empty? || user.password.empty?
            @error = "Username and password can't be blank"
            erb :'/users/signup'
        elsif User.find_by(username: user.username)
            @error = "That username is taken :("
            erb :'/users/signup'
        else
            user.save
            session[:user_id] = user.id
            redirect '/routines'
        end
    end



    # users can delete account


end