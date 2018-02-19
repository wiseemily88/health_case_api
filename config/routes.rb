Rails.application.routes.draw do
namespace :api do
    namespace :v1 do
    resources :medical_histories,  only: [:index]
    resources :family_histories,  only: [:index]
    resources :surgical_histories,  only: [:index]

    namespace :users do
      get '/:user_id/medical_histories', to: "medical_histories#index", as: :user_medical_histories
      post '/:user_id/medical_histories/:medical_history_id', to: "medical_histories#create", as: :new_user_medical_histories
      delete '/:user_id/medical_histories/:medical_history_id', to: "medical_histories#destroy", as: :delete_user_medical_histories
      patch '/:user_id/medical_histories/:medical_history_id', to: "medical_histories#update", as: :edit_user_medical_histories

      get '/:user_id/family_histories', to: "family_histories#index", as: :user_family_histories
      post '/:user_id/family_histories/:family_history_id', to: "family_histories#create", as: :new_user_family_histories
      delete '/:user_id/family_histories/:family_history_id', to: "family_histories#destroy", as: :delete_user_family_histories
      patch '/:user_id/family_histories/:family_history_id', to: "family_histories#update", as: :edit_user_family_histories

      get '/:user_id/surgical_histories', to: "surgical_histories#index", as: :user_surgical_histories
      post '/:user_id/surgical_histories/:surgical_history_id', to: "surgical_histories#create", as: :new_user_surgical_histories
      delete '/:user_id/surgical_histories/:surgical_history_id', to: "surgical_histories#destroy", as: :delete_user_surgical_histories
      patch '/:user_id/surgical_histories/:surgical_history_id', to: "surgical_histories#update", as: :edit_user_surgical_histories
    end
    end
  end
end
