enable :sessions

get '/' do

  if current_user
    session[:user]
    @users = User.all
  else
    redirect '/'
  end

  # render home page
 #TODO: Show all users if user is signed in


  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 

  erb :sign_in
end

post '/sessions' do
  
  # authenticate user here
  # sign-in
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
end

#----------- USERS -----------

# render sign-up page
get '/users/new' do
  erb :sign_up
end

# send new user 
post '/users' do
  p params
  p params[:user]
end
