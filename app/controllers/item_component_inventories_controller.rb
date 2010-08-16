class ItemComponentInventoriesController < InheritedResources::Base
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
  def new
    @item_component_value_id = params[:item_component_value_id]
    new!
  end
  
  def update
    update! { check_path(resource.item_component_value.item.order)}
  end
  
  def create
    create! {check_path(resource.item_component_value.item.order)}
  end
  
  def destroy
    destroy! {check_path(resource.item_component_value.item.order)}
  end
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @item_component_inventories ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
