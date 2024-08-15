Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  root "home#index"

  get 'member/:id', to:  'members#show' , as: 'member'
  get 'edit_description/:id', to: 'members#edit_description', as: 'edit_member_description'
  # patch 'update_description', to: 'member#update_description', as: 'update_member_description'
end
