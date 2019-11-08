Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'auth#login'
  scope '/legal' do
    get '/terms' => 'public#terms', as: :terms
    get '/privacy' => 'public#privacy', as: :privacy
    get '/aup' => 'public#aup', as: :aup
  end
  scope '/federation' do
    get '/oauth' => 'oauth#prompt'
    get '/saml' => 'saml#inform'
  end
  scope '/account' do
    get '/login' => 'auth#login', as: :login
    post '/login' => 'auth#build_user'
    get '/logout' => 'auth#logout'
    get '/signup' => 'auth#signup', as: :signup
    get '/forgot' => 'auth#reset', as: :reset
    get '/confirm/:email/:code' => 'auth#confirm', as: :confirm, :constraints => { email: /[^\/]+/  }
    get '/reset/:reset_code' => 'auth#password', as: :password
  end
  scope '/console' do
    get '/', to: redirect('/console/account')
    get '/account' => 'console#account', as: :account
    get '/log' => 'console#log', as: :log
    scope '/admin' do
      get '/users' => 'admin#users', as: :users
    end
  end
end
