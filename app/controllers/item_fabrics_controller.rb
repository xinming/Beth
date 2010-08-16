class ItemFabricsController < InheritedResources::Base
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
  def update
    update! { check_path(resource.item.order)}
  end
  
  def destroy
    destroy! {check_path(resource.item.order)}
  end
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @item_fabrics ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
