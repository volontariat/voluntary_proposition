Rails.application.routes.draw do
  get '/products/proposition' => 'product/proposition#index', as: 'proposition_product'
  get '/proposition' => 'product/proposition#index'
  
  namespace :proposition do
    resources :units, only: [:new, :create, :show, :edit, :update, :destroy]
    
    get 'workflow' => 'workflow#index', as: :workflow
    
    namespace 'workflow' do
      resources :organization_owner, only: :index
    end
  end
  
  resources :organizations do
    namespace :proposition do
      resources :units, only: [:index, :new]
    end
  end
end
