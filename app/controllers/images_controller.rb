class ImagesController < ApplicationController
  before_action :set_image, only: %i[show edit update destroy]

  def index
    @images = Image.order(created_at: :desc)
    @images = @images.tagged_with(params[:filters]) if params[:filters].present?
  end

  # GET /images/1
  def show; end

  # GET /images/new
  def new
    @image = Image.new
  end

  # POST /images
  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      flash[:errors] = @image.errors.full_messages
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to @image, notice: 'Image was successfully edited.'
    else
      flash[:errors] = @image.errors.full_messages
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @image = Image.find(destroy_params)
    @image.destroy

    redirect_to images_path, notice: 'You have successfully deleted the image.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def image_params
    params.require(:image).permit(:link, :tag_list)
  end

  def destroy_params
    params.require(:id)
  end
end
