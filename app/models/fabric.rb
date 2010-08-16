class Fabric < ActiveRecord::Base
  
  #Paperclip
  has_attached_file :photo, :styles=>{:thumb=>"100x100#"}
  
end
