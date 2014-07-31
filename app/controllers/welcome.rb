get '/welcome' do
  @notes = Note.find_by_user_id(session[:current])
  erb :welcome
end

post '/welcome' do
  note = Note.new(name: params[:topic], text: params[:text], user_id: current_user.id)
  if note.save
  	status 200
  	content_type :JSON
  	{topic: params[:topic], text: params[:text]}.to_json
    # redirect to("/welcome")
  else
  	status 401
    flash[:error] = "Invalid note. Please try again!"
    erb :welcome
  end
end
