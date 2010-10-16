class Company < ActiveRecord::Base
  belongs_to :industry
  has_many :phone_numbers, :as => :phoneable, :dependent => :destroy
  audit_enabled
  
  accepts_nested_attributes_for :phone_numbers,
    :reject_if => proc { |ph| ph['number'].blank? },
    :allow_destroy => true
    
end

