class ContactMeasurementInfosController < InheritedResources::Base
  
  actions :index, :show, :new, :edit, :create, :update, :destroy
  respond_to :html, :js, :xml, :json
  
  def new
    @contact_id = params[:contact_id]
    new!
  end
  
  def update
    update! { contact_path(resource.contact)}
  end
  
  def create
    create! {contact_path(resource.contact)}
  end
  
  def destroy
    destroy! {contact_path(resource.contact)}
  end
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @contact_measurement_infos ||= end_of_association_chain.paginate(paginate_options)
    end
        
end
