class PriceChangesController < ApplicationController
  before_action :set_price_change, only: %i[show update destroy]

  # GET /price_changes
  def index
    @price_changes = PriceChange.all

    render json: @price_changes
  end

  # GET /price_changes/1
  def show
    render json: @price_change
  end

  # POST /price_changes
  def create
    @price_change = PriceChange.new(price_change_params)

    if @price_change.save
      render json: @price_change, status: :created, location: @price_change
    else
      render json: @price_change.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /price_changes/1
  def update
    if @price_change.update(price_change_params)
      render json: @price_change
    else
      render json: @price_change.errors, status: :unprocessable_entity
    end
  end

  # DELETE /price_changes/1
  def destroy
    @price_change.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_price_change
    @price_change = PriceChange.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def price_change_params
    params.require(:price_change).permit(:product_id, :value)
  end
end
