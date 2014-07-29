get '/' do
  erb :index
end

post '/' do
  #user authentication
  user = User.authenticate(params[:input])
  if user
    session[:current] = user.id
    redirect to("/welcome")
  else
    flash[:error] = "Invalid email/password. Please try again!"
  end

#----------------------------------------> if has_secure_password
  # data = params[:data]
  # user = User.find_by_email(data[:email])
  # auth = user.try(:authenticate, data[:password])

  # if auth
  #   session[:current] = user.id
  #   redirect to('/####')
  # else
  #   flash[:error] = "Invalid email/password. Please try again!"
  #   redirect back
  # end
end



get '/logout' do
  session[:current] = nil
  redirect to('/')
end
