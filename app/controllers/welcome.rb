get '/welcome' do
  @notes = Note.find_by_user_id(session[:current])
  erb :welcome
end

post '/welcome' do
  note = Note.create(name: params[:name], text: params[:text], user_id: current_user.id)

  if note.valid?
    redirect to("/welcome")
  else
    flash[:error] = "Invalid note. Please try again!"
    erb :welcome
  end
end
