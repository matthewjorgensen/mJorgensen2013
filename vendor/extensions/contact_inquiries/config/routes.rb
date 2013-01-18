Refinery::Core::Engine.routes.draw do
  # Frontend routes
  namespace :contact_inquiries do
    resources :contact_inquiries, :path => '', :only => [:new, :create] do
      collection do
        get :thank_you
      end
    end    
  end

  # Admin routes
  namespace :contact_inquiries, :path => '' do
    namespace :admin, :path => 'refinery/contact_inquiries' do
      resources :contact_inquiries, :path => '' 
      resources :settings, :only => [:edit, :update]
    end
  end
end

