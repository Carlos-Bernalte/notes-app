class NotesController < ApplicationController
  before_action :destroy, only: %i[destroy ]

  # GET /notes
  def index
    puts "-------------------------------GET NOTES----------------"
    @notes = Note.all
  end

  # GET /notes/1
  def show
    puts "-------------------------------GET NOTE----------------"
    @note = Note.find(params[:id])
  end

  # GET /notes/new
  def new
    puts "-------------------------------NEW NOTE----------------"
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    puts "-------------------------------EDIT NOTE----------------"
    @note = Note.find(params[:id])
  end

  # POST /notes
  def create
    puts "-------------------------------CREATE NOTE----------------"
    @user = User.find(params[:user_id])
    @note = @user.notes.create(note_params)

    if @note.save
      np = NotePermission.create({user_id:@user.id, note_id: @note.id})
      redirect_to user_notes_url(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    puts "-------------------------------UPDATE NOTE----------------"
    if logged?

      @note = Note.find(params[:id])
      
      if @note.update(note_params)
        redirect_to user_notes_url(@note.user_id)
      else
        render 'edit'
      end
    end
  end

  # DELETE /notes/1
  def destroy
    puts "-------------------------------DELETE NOTE----------------"
    if logged?
      note = Note.find(params["note_id"])
      
      note.destroy

      redirect_to user_notes_url(params["user_id"])
    end
  end

  def share
    @note = Note.find(params["note_id"])
    @note_permission = @note.note_permission
  end

  def share_with_friend
    
    note = Note.find(params["note_id"])
    friend_to_share = User.find(params["friend_id"])
    np = NotePermission.create({user_id:friend_to_share.id, note_id: note.id})
    redirect_to user_note_share_path(params["user_id"], note)
  end

  def unshare_with_friend
    note = Note.find(params["note_id"])
    note_permission = note.note_permission
    note_permission.user.delete(User.find(params[:friend_id]))
    redirect_to user_note_share_url(note)
  end

  private

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:title, :text, :image)
    end
    def logged?
      session[:username]
    end
end
