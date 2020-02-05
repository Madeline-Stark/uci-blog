class UsersController < ApplicationController
  
  get '/signup' do #new 
    erb :"users/create_user"
  end
  
  post '/signup' do #create 
    user = User.new(params)
    if user.save && !!params[:username]
      session[:user_id] = user.id
      redirect '/posts'
    else 
      redirect '/signup'
    end
  end
  
  get '/login' do 
    erb :"users/login"
  end
  
  post '/login' do
    #look up user
    user = User.find_by(user_name: params[:user_name])
    #authenticate password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/posts'
    else 
      redirect '/login'
    end
    
  end 
  
  get '/logout' do 
    session.clear
    redirect '/signup'
  end
  
  
  
end