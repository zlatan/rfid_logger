Rfid::Application.routes.draw do
  resources :users
  resources :events
  resources :reports
  root :to => "reports#index"
end
