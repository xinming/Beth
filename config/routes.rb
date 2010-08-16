ActionController::Routing::Routes.draw do |map|
  map.resources :incoming_orders
  map.add_item 'item/new/:incoming_order_id/:item_type_id', :controller=>'incoming_orders', :action=>'add_item'
  map.add_cost 'cost/new/:item_id/:item_type_cost_id', :controller=>'incoming_orders', :action=>'add_cost'
  map.daily 'incoming_orders/daily/:specify', :controller=>'incoming_orders', :action=>'daily'
  
  
  map.resources :costs

  map.resources :item_type_costs

  map.resources :customers

  map.resources :item_measurement_infos
  map.add_item_measurement 'item_measurement_infos/new/:item_id', :controller=>'item_measurement_infos', :action=>'new'

  map.resources :contact_groups

  map.resources :unit_conversions

  map.resources :item_fabrics

  map.resources :fabrics


  map.resources :contact_measurements

  map.resources :foos

  map.resources :contact_measurement_infos
  map.add_measurement 'contact_measurement_infos/new/:contact_id', :controller=>'contact_measurement_infos', :action=>'new'

  map.resources :inventory_summaries

  map.resources :inventory_logs
  map.inventory_logs_by_type 'inventory_logs/item_type/:id', :controller=>'inventory_logs', :action=> 'show_by_type'

  map.resources :item_component_inventories
  map.add_inventory 'item_component_inventories/new/:item_component_value_id', :controller=>'item_component_inventories', :action=> 'new'

  map.resources :component_inventories

  map.resources :inventory_item_types

  map.resources :item_component_values

  map.resources :items

  map.resources :measurement_infos

  map.resources :item_types

  map.resources :component_groups

  map.resources :components

  map.resources :orders
  map.add_item_order 'orders/new/add_item/:item_type/:child_index', :controller => 'orders', :action => 'add_item', :conditions => { :method => :post }
  map.check 'orders/:id/check', :controller => 'orders', :action => 'check'
  map.commit_inventory 'orders/:id/commit_inventory', :controller => 'orders', :action => 'commit_inventory'
  map.accounting 'orders/accounting', :controller => 'orders', :action => 'accounting'

  map.resources :contacts

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
end
