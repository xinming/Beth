class UnitConversion < ActiveRecord::Base
  
    
  def self.ratio(unit1,unit2)
    if unit1 == unit2
      return 1
    else
      foo = UnitConversion.first(:conditions=>{:unit1=>unit1, :unit2=>unit2})
      return foo.ratio
    end
  end
end
