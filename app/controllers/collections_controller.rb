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

    puts "-------------------------------CREATE COLLECTION----------------"
    @user = User.find(params[:user_id])
    @collection = @user.collection.create(collection_params)

    if @collection.save
      redirect_to user_collections_url(@user), notice: "Collection was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /collections/1
  def update
    if @collection.update(collection_params)
      redirect_to user_collections_url(:user_id), notice: "Collection was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /collections/1
  def destroy
    puts "-------------------------------DELETE COLLECTION----------------"
    if logged?
      @collection = Collection.find(params[:id])
      @user = User.find(@collection.user_id)
      @collection.destroy

      redirect_to user_collections_url(@user), notice: "Collection was successfully destroyed."
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
