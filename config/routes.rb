Rails.application.routes.draw do
  root to: 'api/v1/api#index'
  namespace 'api' do
    namespace 'v1' do
      resources :accounts, only: [:index, :show], param: :username
      resources :rates, only: [:index, :show], param: :map
      resources :punishes, only: [:index, :show], param: :punished
    end
  end
end
