# Homepage (Root path)
require "pry"

helpers do
	def current_user
		#binding.pry
		@current_user = User.find(session[:user_id]) if session[:user_id]
	end
end

before do
  redirect '/login' if !current_user && request.path != '/login' && request.path != '/signup'
end

get '/' do
    @movies = Movie.all.reverse
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

get '/movies/new' do #I changed this to plural for convention
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

get '/logout' do
  session.clear # clear the session which 'logs out' the user
  redirect '/signup'
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

#this post takes data from the movies/new page
post '/movies/new' do
  title = params[:title]
  year_released = params[:year_released]
  #do I need user_ID here??

  movie = current_user.movies.create(title: title, year_released: year_released) #this might not be right
  redirect "/movies/#{movie.id}" #this needs to be changed to the movie page
end

get '/movies/:id' do
  @movie = Movie.find(params[:id])
  @user = @movie.user

  erb :movie
end

#this is how to edit a users profile
get '/profile/edit' do
  current_user
  erb :profile
end

post '/profile/edit' do
    username = params[:username]
    email = params[:email]
    password = params[:password]

    current_user.update username: username, email: email, password: password

    redirect '/'
end
