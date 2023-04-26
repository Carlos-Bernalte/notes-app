class CollectionsController < ApplicationController
  # before_action :set_collection, only: %i[ show edit update destroy ]

  # GET /collections
  def index
    @collections = Collection.all
  end

  # GET /collections/1
  def show
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  def create
    @user = User.find(params[:user_id])
    if params[:notes]
      @collection = @user.collections.create(:name => params[:name], :notes => params[:notes])
    else
      @collection = @user.collections.create(:name => params[:name])
    end

    if @collection.save
      flash[:notice] = "Collection created!"
      redirect_to user_collections_url(@user.id)
    else
      flash[:alert] = "Collection not saved!"
      redirect_to user_collections_url(@user.id)
    end
  end

  # DELETE /collections/1
  def destroy
    puts "-------------------------------DELETE COLLECTION----------------"
    if logged?
      collection = Collection.find(params['id'])
      user = User.find(collection.user_id)
      CollectionNote.where(collection_id: collection.id).destroy_all
      collection.destroy

      redirect_to user_collections_url(user), notice: "Collection was successfully destroyed."
    end
  end

  def add_note
    puts "-------------------------------ADD NOTE TO COLLECTION----------------"
    if logged?
      CollectionNote.create(:collection_id => params['collection_id'], :note_id => params['note_id'])
      
      redirect_to edit_user_note_path(params['user_id'], params['note_id'])
    end
  end

  def delete_note
    puts "-------------------------------DELETE NOTE TO COLLECTION----------------"
    if logged?
      CollectionNote.where(:collection_id => params['collection_id'], :note_id => params['note_id']).destroy_all

      redirect_to edit_user_note_path(params[:user_id], params[:note_id])
    end
  end


  private

    # Only allow a list of trusted parameters through.
    def collection_params
      params.require(:collection).permit(:name, :user_id)
    end

    def logged?
      session[:username]
    end
end
