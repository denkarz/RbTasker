Rails.application.routes.draw do
  get '/' => 'custom_controller#index'
  get 'custom_controller/index' => 'custom_controller#index'
  get 'custom_controller/update' => 'custom_controller#update'
  get 'custom_controller/create' => 'custom_controller#create'

  # get 'application_controller/index'
  # get 'application_controller/update'
  # get 'application_controller/create'
end
