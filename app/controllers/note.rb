get "/note_edit" do
 @notes = Note.where(user_id: session[:current])
 erb :note_edit
end


put '/notes_edit/:id' do
  @current_note = Note.find(params[:id])
  @current_note.update_attributes(name: params[:name], text: params[:text])
  redirect to ("/welcome")
end

delete '/notes/delete/:id' do
  Note.delete(params[:id])
  redirect to ("/note_edit")
end
