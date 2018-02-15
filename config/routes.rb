Rails.application.routes.draw do
namespace :api do
    namespace :v1 do
    resources :medical_histories,  only: [:index]

    namespace :users do
      get '/:user_id/medical_histories', to: "medical_histories#index", as: :user_medical_histories
      post '/:user_id/medical_histories/:medical_history_id', to: "medical_histories#create", as: :new_user_medical_histories
    end
    end
  end
end
