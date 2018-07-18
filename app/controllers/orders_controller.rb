# frozen_string_literal: true

class OrdersController < ApplicationController
  load_and_authorize_resource :address, through: :current_user,
                                        if: proc { params[:address_id].present? }
  load_and_authorize_resource through: :address, if: proc { params[:address_id].present? }
  load_and_authorize_resource through: :current_user, unless: proc { params[:address_id].present? }

  # GET /orders
  def index
    @orders = (@address || current_user).orders

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @order.save
    render json: @order, status: :created, location: @order
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end
end
