class Contact < ActiveRecord::Base
  has_many :orders, :foreign_key => 'orderer_id'
  has_many :referred_orders, :foreign_key => 'referrer_id'
  has_many :contact_measurement_infos
  belongs_to :contact_group

  named_scope :clients, :conditions => { :is_client => true }
  named_scope :suppliers, :conditions => { :is_supplier => true }

  def to_s
    name
  end
  
  def commission
    if self.contact_group_id.nil?
      self[:commission]
    else
      self.contact_group.commission
    end
  end
  
  def in_group?
    !self.contact_group_id.nil?
  end
end
