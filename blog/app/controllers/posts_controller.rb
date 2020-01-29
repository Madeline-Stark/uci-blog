class PostsController < ApplicationController
  
 
  get '/posts' do 
    @posts = Post.all
    erb :'/posts/index'
  end
  
  get '/posts/new' do 
    erb :"posts/new"
  end
  
  get '/posts/:id' do 
    @post = Post.find(params[:id])
    erb :"/posts/show"
  end
  
  post '/posts' do 
    post = Post.create(params)
    redirect "/posts/#{post.id}"
  end
 
#edit get '/posts/:id/edit'
#update patch '/posts/:id'


#delete delete '/posts/:id'

  
  
end