Rails.application.routes.draw do
  root 'application#index'

  mount ActionCable.server => '/cable'
end
