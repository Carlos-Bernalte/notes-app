module NotesHelper

  def find_notes(user_id)
    notes = []

    notes = Note.where(user_id: user_id.to_i)

    notes = notes.group_by(&:user_id)        
  end

  def user_session_is_admin?
    if logged?
      admin = User.where(user_name: session[:username]).first.admin
    end
    admin
  end

  def count_notes_user(user_id)
    nnotes = Note.where(user_id: user_id).count
  end

  def get_users_to_edit(note_id)
    note = Note.find(note_id)
    note.note_permission.user - Array.wrap(note.user)
    
  end

  def have_permission(note_id, user_id)
    NotePermission.where(note_id: note_id, user_id: user_id)
  end


  def logged?
    session[:username]
  end
end
