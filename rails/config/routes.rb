Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope '/api' do
    # 既存のルート設定
  end

  get '/test500', to: 'application#test500'
end
