class Api::V1::ApiController < ApplicationController

  def index
    render json: {
        status: true
    }, status: :ok
  end
end
