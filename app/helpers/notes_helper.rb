module NotesHelper

  def find_notes(user_id)
    notes = []

    notes = Note.where(user_id: user_id.to_i)

    notes = notes.group_by(&:user_id)        
  end

  def find_shared_notes(user_id)
    Note.joins(:note_permissions)
    .where("note_permissions.user_id = ? AND notes.user_id != ?", user_id, user_id)
 
  end
  def find_note(note_id)

    Note.find(note_id)
      
  end

  def user_session_is_admin?
    if logged?
      admin = User.where(username: session[:username]).first.admin
    end
    admin
  end

  def count_notes_user(user_id)
    nnotes = Note.where(user_id: user_id).count
  end


  def have_permission(note_id, user_id)
    NotePermission.where(note_id: note_id, user_id: user_id)
  end


  def logged?
    session[:username]
  end
end
