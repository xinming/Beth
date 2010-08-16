module OrdersHelper

  def add_item_link(item_type, form)
    link_to_function "Add a #{item_type}" do |page|
      form.fields_for :items, Item.new(:item_type => item_type), :child_index => "NEW_RECORD" do |item|
        html = render :partial => "item_form", :locals => { :form => item }
        page << "$('#items').append('#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()));"
      end
    end
  end

  def remove_item_link(form)
    if form.object.new_record?
      link_to_function "Remove", "$(this).parents('.item').remove();"
    else
      form.hidden_field(:_delete) +
      link_to_function("Remove", "$(this).parents('.item').hide(); $(this).prev().attr('value', '1');")
    end
  end
  
end
