# frozen_string_literal: true

class OrdersController < ApplicationController
  load_and_authorize_resource through: :current_user

  # GET /orders
  def index
    @orders = current_user.orders

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end
end
