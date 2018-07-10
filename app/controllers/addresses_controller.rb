# frozen_string_literal: true

class AddressesController < ApplicationController
  load_and_authorize_resource through: :current_user

  # GET /addresses
  def index
    @addresses = current_user.addresses

    render json: @addresses
  end

  # GET /addresses/1
  def show
    render json: @address
  end

  # POST /addresses
  def create
    if @address.save
      render json: @address, status: :created, location: @address
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

  # Only allow a trusted parameter "white list" through.
  def address_params
    params.require(:address).permit :first_name,
                                    :last_name,
                                    :mobile_number,
                                    :line1,
                                    :line2,
                                    :zip_code,
                                    :city,
                                    :country
  end
end
