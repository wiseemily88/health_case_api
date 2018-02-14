Rails.application.routes.draw do
namespace :api do
    namespace :v1 do
    resources :medical_histories,  only: [:index]
    end
  end
end
