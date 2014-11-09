Rails.application.routes.draw do
  root 'users#index'
  get  'users' => 'users#index'
end
