# Homepage (Root path)
require "pry"

helpers do
	def current_user
		#binding.pry
		@current_user = User.find(session[:user_id]) if session[:user_id]
	end
end

get '/' do
  erb :index
end

get '/login' do
    erb :login
end

get '/signup' do
    erb :signup
end

get '/profile' do
    erb :profile
end

get '/movie/new' do
    erb :new_movie
end

post '/login' do
	username = params[:username]
	password = params[:password]
  user = User.find_by(username: username)
  
  	if user.password == password
    	session[:user_id] = user.id
    	redirect '/'
  	else
    	redirect '/login'
  end
end

post '/signup' do
	username = params[:username]
	password = params[:password]

	user = User.find_by(username: username)
		if user
			redirect '/'
		else
			user = User.create(username: username, password: password)
    		session[:user_id] = user.id
    		redirect '/'
	end
end

post '/profile/edit' do
    redirect '/'
end
