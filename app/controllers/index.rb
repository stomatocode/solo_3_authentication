enable :sessions

get '/' do

  if current_user
    puts 'working'
  end

  # render home page
  #TODO: Show all users if user is signed in
  @all_users = User.all
  erb :index
end

#----------- USERS -----------

# render sign-up page
get '/users/new' do
  erb :sign_up
end

# send new user 
post '/users' do

  new_user = User.create(params['user'])
  session[:user_id] = new_user.id

  redirect '/'
end



#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 

  erb :sign_in
end

post '/sessions' do

  email = params[:email]
  password = params[:password]

  authenticated = User.authenticate(email, password)

  

  if authenticated 
    session[:user_id] = authenticated.id
    @all_users = User.all
    erb :index
  else
    redirect '/'
  end

  # authenticate user here
  # sign-in

  # session[:user_id] = 
end

delete '/sessions/:id' do
  session.clear
  # sign-out -- invoked via AJAX
end


