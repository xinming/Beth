class CostsController < InheritedResources::Base
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
  def destroy
    destroy! {incoming_order_path(resource.item.order)}
  end
  
  def update
    update! {incoming_order_path(resource.item.order)}
  end
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @costs ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
