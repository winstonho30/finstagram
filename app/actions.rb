get '/' do

    @posts = Post.order(created_at: :desc)
    erb(:index)

end

get '/signup' do 
    @user = User.new
    erb(:signup)
end

post '/signup' do
    email = params[:email]
    avatar_url = params[:avatar_url]
    username = params[:username]
    password = params[:password]
    
    @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password})
    
    if @user.save
    
        "User #{username} saved the world!"
    
else
    
    erb(:signup)
    
end

end

