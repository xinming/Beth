class IncomingOrder < ActiveRecord::Base
  belongs_to :customer
  has_many :items, :foreign_key=>'order_id'
  accepts_nested_attributes_for :items, :allow_destroy => true
  
  def categories
    categories = []
    count = []
    self.items.each do |item|
      type = item.item_type.name
      if categories.include? type
        i = categories.index(type)
        count[i] = count[i] + 1
      else
        categories << type
        count << 1
      end
    end
    str = ""
    in_loop = false
    categories.each_with_index do |cat, i|
      in_loop = true
      #cat = (count[i] > 1) ? cat.en.plural : cat
      str << count[i].to_s << " " << cat << ", "
    end
    
    if in_loop      
      str = str.chop.chop
    end
    str
    #raise categories.inspect
    #raise count.inspect
  end
  
  
  def price
    price = 0
    self.items.each do |item|
      price = price + item.price
    end
    price
  end
  
end
