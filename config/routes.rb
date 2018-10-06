Rails.application.routes.draw do
  resources :users do
    resources :entry_times
    resources :off_times
    resources :employee_records, only: [:index]
  end

  post 'auth/login', to: 'authentication#authenticate'
end
