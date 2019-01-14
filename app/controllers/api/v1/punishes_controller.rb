class Api::V1::PunishesController < ApplicationController

  def index
    paginate Punish.unscoped, per_page: 50
  end

  def show
    account =
    punish = Punish.where(punished: Account.where(username: params[:punished]))
    render json: {
        punish: punish,
        count: punish.size
    }, status: :ok
  end
end
