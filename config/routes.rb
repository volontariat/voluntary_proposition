Rails.application.routes.draw do
  get '/products/proposition' => 'product/proposition#index', as: 'proposition_product'
  get '/proposition' => 'product/proposition#index'
  
  namespace :proposition do
    get 'workflow' => 'workflow#index', as: :workflow
    
    namespace 'workflow' do
      resources :organization_owner, only: :index
    end
  end
end
