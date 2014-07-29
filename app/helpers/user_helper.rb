helpers do
  def current_user   #MAKE SURE TO SET session[:current] = CURRENT USER ID!!! DONE IN CONTROL
    @current_user ||= User.find_by_id(session[:current])
  end
end
