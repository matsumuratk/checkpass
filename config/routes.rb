Checkpass::Application.routes.draw do
  #get "admin/index"
  #get "admin/nouse"
  #get "admin/show"
  #get "admin/user_index"
  #get "checkin_items/index"
  #get "checkin_items/show"
  #get "checkin_items/new"
  #get "checkin_items/edit"
  #get "checkin_items/create"
  #match 'shops/index', :to => 'shops#index', :as => 'shops'
  #match 'shops/edit_manager', :to => 'shops#edit_manager', :as => 'edit_manager_shops'
  #match 'shops/item/:id/edit', :to => 'shops#edit_item', :as => 'edit_item_shops'

  #get "shops/update_manager"
  #get "shops/update_item"
  #get "shops/paypal"
  #get "shops/paypal_callback"
  #get "checkin/place"
  #get "checkin/docheckin"
  #get "checkin/showplace"
  #get "commons/callback"

  match 'commons/callback' => 'commons#callback'

  #ユーザー機能
  match 'checkin/place/:access_key', :to => 'checkin#place'
  match 'checkin/docheckin', :to => 'checkin#docheckin'
  match 'checkin/preview_place/:access_key', :to => 'checkin#preview_place'
  match 'checkin/preview_docheckin/:access_key', :to => 'checkin#preview_docheckin'
  match 'checkin/preview_docheckin/:access_key', :to => 'checkin#preview_docheckin'
  match 'checkin/preview_facebook/:access_key', :to => 'checkin#preview_facebook'  
  
  #店舗管理機能
  match "shop_admin/", :to => 'shop_admin#index', :as => 'shop_admin', :defaults => {:render=>'index'}
  match "shop_admin/noregist", :to => 'shop_admin#noregist', :as => 'noregist_shop_admin'
  match "shop_admin/regist", :to => 'shop_admin#regist', :as => 'regist_shop_admin'
  match "shop_admin/doregist", :to => 'shop_admin#doregist', :as => 'doregist_shop_admin'
  match "shop_admin/index", :to => 'shop_admin#index', :as => 'index_shop_admin', :defaults => {:render=>'index'}
  match "shop_admin/index_checkinitem", :to => 'shop_admin#index', :as => 'index_checkinitem_shop_admin', :defaults => {:render=>'index_checkinitem'}
  match "shop_admin/index_checkinlog", :to => 'shop_admin#index', :as => 'index_checkinlog_shop_admin', :defaults => {:render=>'index_checkinlog'}
  match "shop_admin/edit_manager", :to => 'shop_admin#edit_manager', :as => 'edit_manager_shop_admin'
  match "shop_admin/update_manager", :to => 'shop_admin#update_manager', :as => 'update_manager_shop_admin'
  match "shop_admin/new_item", :to => 'shop_admin#new_item', :as => 'new_item_shop_admin'
  match "shop_admin/create_item", :to => 'shop_admin#create_item', :as => 'create_item_shop_admin'
  match "shop_admin/edit_item/:access_key", :to => 'shop_admin#edit_item', :as => 'edit_item_shop_admin'
  match "shop_admin/update_item/:access_key", :to => 'shop_admin#update_item', :as => 'update_item_shop_admin'
  match "shop_admin/destroy/:access_key", :to => 'shop_admin#destroy_item', :as => 'destroy_item_shop_admin'

  match "shop_admin/paypal_checkout", :to => 'shop_admin#paypal_checkout'
  match "shop_admin/paypal_notify", :to => 'shop_admin#paypal_notify'
  match "shop_admin/paypal_cancel", :to => 'shop_admin#paypal_cancel'

  match 'shop_admin/search', :to => 'shop_admin#search'
  match 'shop_admin/search_by_fbid', :to => 'shop_admin#search_by_fbid'

  match 'shop_admin/paypal_checkout_debug', :to => 'shop_admin#paypal_checkout_debug', :as => 'paypal_checkout_debug_shop_admin'
  match 'shop_admin/paypal_cancel_debug/:access_key', :to => 'shop_admin#paypal_cancel_debug', :as => 'paypal_cancel_debug_shop_admin'
  
  match "shop_admin/preview_upload_top_image", :to => 'shop_admin#preview_upload_top_image'
  match "shop_admin/preview_upload_middle_image", :to => 'shop_admin#preview_upload_middle_image'
  match "shop_admin/preview_upload_coupon_image", :to => 'shop_admin#preview_upload_coupon_image'
  match "shop_admin/preview_upload_wall_picture", :to => 'shop_admin#preview_upload_wall_picture'
  
  #管理者機能
  match 'admin', :to => 'admin#index', :as => 'admin'
  match 'admin/index', :to => 'admin#index', :as => 'index_admin'
  match 'admin/show_shop/:fbUserId', :to => 'admin#show_shop', :as => 'show_shop_admin'
  match 'admin/edit_shop/:fbUserId', :to => 'admin#edit_shop', :as => 'edit_shop_admin'
  match 'admin/update_shop/:fbUserId', :to => 'admin#update_shop', :as => 'update_shop_admin'
  match 'admin/index_checkin_item', :to => 'admin#index_checkin_item', :as => 'index_checkin_item_admin'
  match 'admin/show_checkin_item/:access_key', :to => 'admin#show_checkin_item', :as => 'show_checkin_item_admin'
  match 'admin/edit_checkin_item/:access_key', :to => 'admin#edit_checkin_item', :as => 'edit_checkin_item_admin'
  match 'update_checkin_item/:access_key', :to => 'admin#update_checkin_item', :as => 'update_checkin_item_admin'
  match 'new_checkin_item', :to => 'admin#new_checkin_item', :as => 'new_checkin_item_admin'
  match 'create_checkin_item', :to => 'admin#create_checkin_item', :as => 'create_checkin_item_admin'
  match 'index_checkin_log', :to => 'admin#index_checkin_log', :as => 'index_checkin_log_admin'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
