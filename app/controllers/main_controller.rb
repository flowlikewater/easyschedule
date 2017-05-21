class MainController < ApplicationController

  def index
    response = RestClient::Request.execute(
                      method: :get,
                      url: "localhost:3000/api/v1/rooms/#{params[:room]}.json",
                      headers: {api_key: Rails.application.secrets.BOOKING_API_KEY, token: params[:token]}
                      )
    # object class is important here to help turn it into a user friendly format
    @room = JSON.parse(response.body, object_class:OpenStruct)

    response2 = RestClient::Request.execute(
                      method: :get,
                      url: "localhost:3000/api/v1/users/#{params[:token]}.json",
                      headers: {api_key: Rails.application.secrets.BOOKING_API_KEY, token: params[:token]}
                      )
    # object class is important here to help turn it into a user friendly format
    @user = JSON.parse(response2.body, object_class:OpenStruct)
    @bookings = Booking.where(room_ref: @room[:room].ref)
    @booking = Booking.new()
  end

  def create
    booking = Booking.new()
    booking.room_ref = @room[:room].ref
    booking.date = Date.today
    booking.email = @user.email
    booking.save
  end

  def nesthost
    url = "http://localhost:3000/rooms/"
    redirect_to url
  end

end
