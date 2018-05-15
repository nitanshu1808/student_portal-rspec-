Rails.application.routes.draw do
  resources :students
  root to:  'students#index'
  get 'all_students', to: 'students#all_students'
end
