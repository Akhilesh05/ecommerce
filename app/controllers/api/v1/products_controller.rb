# frozen_string_literal: true

module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: %i[show update destroy]
      before_action :set_brand, if: proc { params[:brand_id].present? }

      # GET /products
      def index
        @products = subject.all

        render json: @products
      end

      # GET /products/1
      def show
        render json: @product
      end

      # POST /products
      def create
        @product = subject.new(product_params)

        if @product.save
          render json: @product, status: :created, location: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /products/1
      def update
        if @product.update(product_params)
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # DELETE /products/1
      def destroy
        @product.destroy
      end

      private

      def set_brand
        @brand = Brand.find(params[:brand_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = subject.find(params[:id])
      end

      def subject
        (@brand&.products || Product)
      end

      # Only allow a trusted parameter "white list" through.
      def product_params
        params.require(:product).permit(:name, :description)
      end
    end
  end
end
