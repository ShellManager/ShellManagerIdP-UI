Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'public#new'
  get '/changelog' => 'public#changelog', as: :changelog
  get '/about' => 'public#about', as: :about
  get '/services' => 'public#services', as: :services
  get '/faq' => 'public#faq', as: :faq
  get '/security' => 'public#security', as: :security
  get '/pricing' => 'public#pricing', as: :pricing
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
    get '/confirm/:email/:code' => 'auth#confirm', as: :confirm, :constraints => { email: /[^\/]+/  }
  end
  scope '/console' do
    get '/' => 'console#new', as: :console
    get '/account' => 'console#account', as: :account
    get '/billing' => 'console#billing', as: :billing
    get '/email' => 'console#email', as: :email
    get '/znc' => 'console#znc', as: :znc
    get '/log' => 'console#log', as: :log
    scope '/admin' do
      get '/users' => 'admin#users', as: :users
      get '/nodes' => 'admin#nodes', as: :nodes
      get '/hypervisors' => 'admin#hypervisors', as: :hypervisors
      get '/payments' => 'admin#payments', as: :payments
    end
  end
end
