class ImagesController < ApplicationController
  before_action :set_image, only: %i[show update destroy]
  before_action :set_product

  # GET /images
  def index
    @images = @product.images

    render json: @images
  end

  # GET /images/1
  def show
    render json: @image
  end

  # POST /images
  def create
    @image = @product.images.new(image_params)

    if @image.save
      render json: @image, status: :created, location: [@product, @image]
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = @product.images.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def image_params
    params.require(:image).permit(:name, :url)
  end
end
