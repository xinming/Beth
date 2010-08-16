class ItemTypeCostsController < InheritedResources::Base
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
  def create
    create! { item_type_costs_path }
  end
 
  def update
    update! { item_type_costs_path }
  end
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @item_type_costs ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
