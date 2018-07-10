# frozen_string_literal: true

class OrderLinesController < ApplicationController
  before_action :set_order_line, only: %i[show update destroy]

  # GET /order_lines
  def index
    @order_lines = OrderLine.all

    render json: @order_lines
  end

  # GET /order_lines/1
  def show
    render json: @order_line
  end

  # POST /order_lines
  def create
    @order_line = OrderLine.new(order_line_params)

    if @order_line.save
      render json: @order_line, status: :created, location: @order_line
    else
      render json: @order_line.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_lines/1
  def update
    if @order_line.update(order_line_params)
      render json: @order_line
    else
      render json: @order_line.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_lines/1
  def destroy
    @order_line.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order_line
    @order_line = OrderLine.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def order_line_params
    params.require(:order_line).permit(:order_id, :product_id, :quantity, :unit_price)
  end
end
