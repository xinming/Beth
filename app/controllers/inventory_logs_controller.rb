class InventoryLogsController < InheritedResources::Base
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
  def show_by_type
    @inventory_logs ||= InventoryLog.find_all_by_inventory_item_type_id(params[:id])
    render 'index_by_type'
  end
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @inventory_logs ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
