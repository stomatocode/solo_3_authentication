enable :sessions

get '/' do

  if current_user
    @all_users = User.all
  end

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

end

delete '/sessions/:id' do
  session.clear
end


