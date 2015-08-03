LonelyPlanetTest::Application.routes.draw do
  root 'dashboard#index'

  resource :taxonomies, only: [:new, :create]
  resource :destinations, only: [:new, :create]
end
