class Company < ActiveRecord::Base
  belongs_to :industry
  
  has_many :phone_numbers, :as => :phoneable, :dependent => :destroy
  
  has_many :employments
  has_many :people, :through => :employments
  
  audit_enabled
  
  accepts_nested_attributes_for :phone_numbers,
    :reject_if => proc { |ph| ph['number'].blank? },
    :allow_destroy => true
  
  def to_label
    name
  end
  
end

