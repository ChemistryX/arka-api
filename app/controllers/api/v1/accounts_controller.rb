class Api::V1::AccountsController < ApplicationController

  def index
    paginate Account.unscoped, per_page: 50
  end

  def show
    account = Account.find_by_username(params[:username])
    render json: account, status: :ok
  end
end