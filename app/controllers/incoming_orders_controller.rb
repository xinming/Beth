class IncomingOrdersController < InheritedResources::Base
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
  def search_date
  
  end
  
  def add_item_type_cost
    @item_type = params[:item_type]
    @child_index = params[:child_index]

    render :layout => false
  end
  
  def add_item
    item_type_id = params[:item_type_id]
    incoming_order_id = params[:incoming_order_id]
    
    Item.create(:item_type_id=>item_type_id, :order_id=>incoming_order_id)
    
    redirect_to incoming_order_path(incoming_order_id)
  end
  
  def add_cost
    item_id = params[:item_id]
    item_type_cost_id = params[:item_type_cost_id]
    tc = ItemTypeCost.find(item_type_cost_id)
    
    c = Cost.create(:item_id=>item_id, :item_type_cost_id=>item_type_cost_id, :amount=>tc.amount)
    
    redirect_to resource_path(c.item.order)
  end
  
  def daily
    @date = params[:specify]
    if @date == 'today'
      @date = Date.today.to_s
    elsif @date == 'search'
      @date = params[:date]
      #redirect_to daily_path(@date)
    end
    @incoming_orders = IncomingOrder.all(:conditions=>{:date=>@date})
 #   raise @incoming_orders.inspect
    @title = "Daily sales report"
    render :orders_list
  end
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @incoming_orders ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
