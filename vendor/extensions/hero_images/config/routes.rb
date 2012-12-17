Refinery::Core::Engine.routes.append do

  # Admin routes
  namespace :hero_images, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :hero_images, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
