get '/register' do
  erb :register
end

post '/register' do
  user = User.create(params[:input])
  if user.valid?
    session[:current] = user.id
    redirect to("/welcome")
  else
    erb :register
  end
end
