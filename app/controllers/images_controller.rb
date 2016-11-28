class ImagesController < ApplicationController
  # GET /images
  # GET /images.json
  def index
    @images = User.find(params[:user_id]).images
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # POST /images
  # POST /images.json
  def create
    @image = current_user.images.build(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to user_images_path(current_user), notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    Image.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:image)
    end
end
