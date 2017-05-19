class Api::V1::UsersController < ApplicationController
  respond_to :json

  skip_before_action :verify_authenticity_token

  def show
    respond_with User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    # if the user is saved successfully then respond with json data and status code 201
    if user.save
      render json: user, status: 201
    else
      render json: {errors:user.errors}, status: 422
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user, status: 200
    else
      render json: {errors: user.errors}, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy()
    # we are giving 204 code which means the server has processed the request and doesn't return any content
    head 204
  end

  # The private method user_params sanitizes the attributes to be assigned through mass-assignment
  private
  def user_params
    params.permit(:email,:password,:password_confirmation)
  end
end
