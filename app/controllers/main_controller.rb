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

  end

end
