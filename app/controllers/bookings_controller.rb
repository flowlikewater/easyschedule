class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    # comment out test
    # @bookings = Booking.where(room_ref: session[:room_ref])

    @bookings = Booking.where(state:'booked').where(room_ref: session[:room_ref])
    @rejections = Booking.where(state:'rejected').where(room_ref: session[:room_ref])
    @requests = Booking.where(state:'requested').where(room_ref: session[:room_ref])
    # perhaps need to combine with Booking.where(start: params[:start_date]..params[:end_date])
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
    params[:booking][:start_date]=params[:booking][:date_range].slice(0, 10)
    params[:booking][:end_date]=params[:booking][:date_range].last(10)
    @booking = Booking.new(booking_params)
    @booking.save
    @bookings = Booking.where(room_ref: session[:room_ref])
  end

  def update
    if params[:booking][:date_range].present?
    params[:booking][:start_date] = params[:booking][:date_range].slice(0, 10)
    params[:booking][:end_date] = params[:booking][:date_range].last(10)
    end
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
      params.require(:booking).permit(:id, :booker_email, :landlord_email , :room_ref, :date_range, :start_date, :end_date, :state)
    end
end
