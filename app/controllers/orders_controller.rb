class OrdersController < InheritedResources::Base
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json

  def add_item
    @item_type = params[:item_type]
    @child_index = params[:child_index]

    render :layout => false
  end
  
  def check
  end
  
  def accounting
  end
  
  def commit_inventory
    #convert = UnitConversion.ratio('yard','meter')
    #raise convert.inspect

    resource.items.each do |item|
      #Component Inventories
      item.values.each do |component|
        component.item_component_inventories.each do |inv|
          InventoryLog.create(:inventory_item_type_id=>inv.inventory_item_type_id, :amount=>-1*inv.amount, :order=>resource)
        end
      end
      #Fabrics
      item.item_fabrics.each do |itemfabric|
        amount = -1 * itemfabric.amount * UnitConversion.ratio(itemfabric.unit, itemfabric.fabric.unit)
        InventoryLog.create(:inventory_item_type_id=>itemfabric.fabric_id, :amount=>amount, :order=>resource)
      end
    end
    flash[:notice] = "Dude! Nice job committing those inventories."
    redirect_to inventory_logs_path
  end

  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @orders ||= end_of_association_chain.paginate(paginate_options) 
    end
        
end
