class ItemMeasurementInfosController < InheritedResources::Base
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
  def new
    @item_id = params[:item_id]
    new!
  end
  
  def update
    update! { order_path(resource.item.order)}
  end
  
  def create
    create! {order_path(resource.item.order)}
  end
  
  def destroy
    destroy! {order_path(resource.item.order)}
  end
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @item_measurement_infos ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
