RakeUi::Engine.routes.draw do
  root :to  => "rake_tasks#index"
  resources :rake_tasks
end
