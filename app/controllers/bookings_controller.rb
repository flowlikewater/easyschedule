class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.where(room_ref: session[:room_ref])
    # perhaps need to combine with Booking.where(start: params[:start]..params[:end])
    @booking = Booking.new()
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    booking_params
    params[:booking][:start]=params[:booking][:date_range].slice(0, 10)
    params[:booking][:end]=params[:booking][:date_range].last(10)
    @booking = Booking.new(booking_params)
    @booking.save
    @bookings = Booking.where(room_ref: session[:room_ref])
  end

  def update
    @booking.update(booking_params)
  end

  def destroy
    @booking.destroy
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:booker_email, :landlord_email , :room_ref, :date_range, :start, :end)
    end
end
