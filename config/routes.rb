Rails.application.routes.draw do
namespace :api do
    namespace :v1 do
    resources :medical_histories,  only: [:index]
    resources :family_histories,  only: [:index]
    resources :surgical_histories,  only: [:index]
    resources :immunizations,  only: [:index]
    resources :health_maintenances, only: [:index]

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

      get '/:user_id/prescriptions', to: "prescriptions#index", as: :user_prescriptions
      post'/:user_id/prescriptions', to:"prescriptions#create", as: :user_new_prescriptions
      patch'/:user_id/prescriptions/:prescription_id', to:"prescriptions#update", as: :user_edit_prescriptions
      delete'/:user_id/prescriptions/:prescription_id', to:"prescriptions#destroy", as: :user_delete_prescriptions

      get '/:user_id/immunizations', to: "immunizations#index", as: :user_immunizations
      post '/:user_id/immunizations/:immunization_id', to: "immunizations#create", as: :new_user_immunization_histories
      delete'/:user_id/immunizations/:immunization_id', to:"immunizations#destroy", as: :user_delete_immunizations
      patch'/:user_id/immunizations/:immunization_id', to:"immunizations#update", as: :user_edit_immunizations

      get '/:user_id/health_maintenances', to: "health_maintenances#index", as: :user_health_maintenances
      post '/:user_id/health_maintenances/:health_maintenance_id', to: "health_maintenances#create", as: :new_user_health_maintenaces
      delete'/:user_id/health_maintenances/:health_maintenance_id', to:"health_maintenances#destroy", as: :user_delete_health_maintenances
      patch'/:user_id/health_maintenances/:health_maintenance_id', to:"health_maintenances#update", as: :user_edit_health_maintenances
    end
    end
  end
end
