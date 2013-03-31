Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :reports do
    resources :reports, :path => '', :only => [:index, :show]
    resources :departments, :path => 'departments'
  end

  # Admin routes
  namespace :reports, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :reports, :except => :show do
        collection do
          post :update_positions
        end
        resources :images, except: [:show, :edit, :update]
      end
      resources :departments, except: [:show]
    end
  end

end
