class NotesController < ApplicationController
  # before_action :set_note, only: %i[ show edit update destroy ]

  # GET /notes
  def index
    puts "----> GET /notes"
    @notes = Note.all
  end

  # GET /notes/1
  def show
    puts "----> GET /note"
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
      redirect_to user_notes_url(@user), notice: "Note was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
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
    puts "Note was successfully deleted"
    if logged?
      @note = Note.find(params[:id])
      @user = User.find(@note.user_id)
      @note.destroy

      redirect_to user_notes_url(@user)
    end
  end

  private


    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:title, :text, :image)
    end
    def logged?
      session[:user_name]
    end
end
