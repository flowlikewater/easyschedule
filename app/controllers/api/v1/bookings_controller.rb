class Api::V1::BookingsController < ApplicationController

  # skip_before_action :verify_authenticity_token

  before_action :authenticate

  respond_to :json

  def index
    search_start = request.headers["HTTP_START_DATE"]
    search_end = request.headers["HTTP_END_DATE"]
    rooms = JSON.parse(request.headers["HTTP_ROOMS"], object_class:OpenStruct)
    # looks for just the id, for the full list of columns of unavailability take out select(:room_ref).distinct
    full_rooms = Booking.select(:room_ref).distinct.where(room_ref: rooms).where("start_date<='#{search_end}'::date").where("end_date>='#{search_start}'::date")
    respond_with full_rooms
  end

  def show
    respond_with Booking.find(params[:id])
  end
  #
  # def create
  #   booking = Booking.new(booking_params)
  #   # if the booking is saved successfully then respond with json data and status code 201
  #   if booking.save
  #     render json: booking, status: 201
  #   else
  #     render json: {errors:booking.errors}, status: 422
  #   end
  # end
  #
  # def update
  #   booking = Booking.find(params[:id])
  #
  #   if booking.update(booking_params)
  #     render json: booking, status: 200
  #   else
  #     render json: {errors: booking.errors}, status: 422
  #   end
  # end
  #
  # def destroy
  #   booking = Booking.find(params[:id])
  #   booking.destroy()
  #   # we are giving 204 code which means the server has processed the request and doesn't return any content
  #   head 204
  # end

  # The private method booking_params sanitizes the attributes to be assigned through mass-assignment
  private
  def booking_params
    params.permit(:email,:password,:password_confirmation)
  end

  protected
  def authenticate
    unless request.headers["HTTP_API_KEY"] == Rails.application.secrets.BOOKING_API_KEY
      head(403)
    end
  end
end
