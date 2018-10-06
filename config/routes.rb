Rails.application.routes.draw do
  resources :users do
    resources :entry_times
    resources :off_times
  end
  resources :employee_records, only: [:index]

  post 'auth/login', to: 'authentication#authenticate'
end
