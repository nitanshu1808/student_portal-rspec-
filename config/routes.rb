Rails.application.routes.draw do
  namespace :admin do
      resources :students

      root to: "students#index"
    end
  resources :students, only: [:index, :new, :create]
  root to:  'students#index'
  get 'all_students', to: 'students#all_students'

  get '*path' => redirect('/')
end
