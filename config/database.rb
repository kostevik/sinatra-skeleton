configure :development, :production do

	db = URI.parse('postgres://pprikjwzgmpjfx:zLoT3uS7-ZVoOmdVEedEGTfysE@ec2-107-21-219-142.compute-1.amazonaws.com:5432/dchk160detf376')

	ActiveRecord::Base.establish_connection(
	  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
	  :host     => db.host,
	  :username => db.user,
	  :password => db.password,
	  :database => db.path[1..-1],
	  :encoding => 'utf8'
	)
end

