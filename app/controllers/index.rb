enable :sessions

get '/' do
  @posts = Post.all
  
  erb :index
end

get '/logout' do
  session.clear
  
  redirect to ('/')
end

get '/create_login' do


  erb :create_login
end

get '/profile/:id' do
  if session[:id]
    @user = User.find_by_id(params[:id])
  erb :profile
  else
    redirect to ('/create_login')
  end
end

#__________________________________________________

post '/create_user' do
  @user = User.create(name: params[:name], password: params[:password], password_confirmation: params[:password])
  session[:id] = @user.id



  redirect to ("/profile/#{@user.id}")
end

post '/login' do
  
  @user = User.find_by_name(params[:name]).try(:authenticate,params[:password])
  if @user
    session[:id] = @user.id

    redirect to ("/profile/#{@user.id}")
  else

    redirect to ('/create_login')
  end
end

post '/create_post' do
  @user = User.find(session[:id])
  @post = Post.create(title: params[:title], url: params[:url])
  @user.posts << @post
  redirect to ("/")
end




