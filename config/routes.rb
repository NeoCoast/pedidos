Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "group_orders#index"

  post "set_user", to: "sessions#create"

  resources :users
  resources :restaurants do
    resources :menu_items do
      resources :toppings, except: [:index, :show]
      resources :extras, except: [:index, :show]
    end
  end

  resources :group_orders do
    member do
      patch :advance_status
      patch :update_discount
      patch :update_discount_from_total
      patch :update_bank_account
    end
    resources :individual_orders, only: [:new, :create, :edit, :update, :destroy] do
      member { patch :toggle_paid }
    end
  end

  # API endpoint for fetching menu item options (toppings/extras)
  get "menu_items/:id/options", to: "menu_items#options", as: :menu_item_options
end
