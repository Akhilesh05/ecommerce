# frozen_string_literal: true

class UsersController < ApplicationController
  load_and_authorize_resource except: :authenticate
  # No need to fetch user since now CanCanCan is
  # loading your resource automatically beforehand
  # before_action :set_user, only: %i[show update destroy]
  skip_before_action :authorize, only: %i[authenticate create]

  def authenticate
    auth = AuthenticateUser.new(user_params[:email], user_params[:password])
    render json: { auth_token: auth.token }
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params[:user][:password] = params[:password] if params[:password].present?
    params.require(:user).permit :first_name,
                                 :last_name,
                                 :nic_number,
                                 :passport_country_number,
                                 :nationality,
                                 :mobile_number,
                                 :email,
                                 :password
  end
end