class Api::V1::RatesController < ApplicationController

  def index
    paginate Rate.unscoped, per_page: 50
  end

  def show
    rate = Rate.where(map: params[:map])
    render json: rate, status: :ok
  end
end
