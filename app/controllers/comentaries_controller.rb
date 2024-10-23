class ComentariesController < ApplicationController
  before_action :set_comentary, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /comentaries or /comentaries.json
  def index
    @comentaries = Comentary.all
  end

  # GET /comentaries/1 or /comentaries/1.json
  def show
  end

  # GET /comentaries/new
  def new
    @comentary = Comentary.new
  end

  # GET /comentaries/1/edit
  def edit
  end

  # POST /comentaries or /comentaries.json
  def create
    @photo = Photo.find(params[:photo_id])
    @comentary = @photo.comentaries.build(comentary_params)
    @comentary.user = current_user

    respond_to do |format|
      if @comentary.save
        format.html { redirect_to @photo, notice: "Comentario creado exitosamente." }
        format.json { render :show, status: :created, location: @comentary }
      else
        format.html { render 'photos/show', status: :unprocessable_entity }
        format.json { render json: @comentary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentaries/1 or /comentaries/1.json
  def update
    respond_to do |format|
      if @comentary.update(comentary_params)
        format.html { redirect_to @comentary, notice: "Comentario actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @comentary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comentary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentaries/1 or /comentaries/1.json
  def destroy
    @comentary.destroy!
    respond_to do |format|
      format.html { redirect_to comentaries_path, status: :see_other, notice: "Comentario eliminado exitosamente." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comentary
    @comentary = Comentary.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comentary_params
    params.require(:comentary).permit(:description)
  end
end
