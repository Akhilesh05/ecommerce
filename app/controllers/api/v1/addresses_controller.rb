# frozen_string_literal: true

module Api
  module V1
    class AddressesController < ApplicationController
      before_action :set_address, only: %i[show update destroy]
      before_action :set_user

      # GET /addresses
      def index
        @addresses = @user.addresses

        render json: @addresses
      end

      # GET /addresses/1
      def show
        render json: @address
      end

      # POST /addresses
      def create
        @address = @user.addresses.new(address_params)

        if @address.save
          render json: @address, status: :created, location: [@user, @address]
        else
          render json: @address.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /addresses/1
      def update
        if @address.update(address_params)
          render json: @address
        else
          render json: @address.errors, status: :unprocessable_entity
        end
      end

      # DELETE /addresses/1
      def destroy
        @address.destroy
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_address
        @address = @user.addresses.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def address_params
        params.require(:address).permit(
          :full_name,
          :line1,
          :line2,
          :zip_code,
          :city,
          :country
        )
      end
    end
  end
end
