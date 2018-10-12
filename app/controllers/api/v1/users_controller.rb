class Api::V1::UsersController < ApplicationController
  # before_action :authenticate, only: [:index]
  def index
    users = User.all
    render json: users
  end

  def create
    @user = User.new

    @user.email = params[:email]
    @user.password = params[:password]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.address_line_1 = params[:address_line_1]
    @user.address_line_2 = params[:address_line_2]
    @user.address_city = params[:address_city]
    @user.address_state = params[:address_state]
    @user.address_zip = params[:address_zip]

    if (@user.save)
      render json: {
        email: @user.email,
        first_name: @user.first_name,
        last_name: @user.last_name,
        address_line_1: @user.address_line_1,
        address_line_2: @user.address_line_2,
        address_city: @user.address_city,
        address_state: @user.address_state,
        address_zip: @user.address_zip,
        # token: gen_token()
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  # def currentuser
  #   @user = User.find_by(id: get_token_payload('sub'))
  #
  #   if (!!@user)
  #     render json: @user
  #   else
  #     render json: {
  #       message: 'Invalid token.'
  #     }, status: :unauthorized
  #   end
  # end

  private
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :address_line_1, :address_line_2, :address_city, :address_state, :address_zip)
    end
end
