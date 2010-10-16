class Person < ActiveRecord::Base

  has_many :phone_numbers, :as => :phoneable, :dependent => :destroy
  audit_enabled :fields => [:first_name, :last_name]
  
  accepts_nested_attributes_for :phone_numbers,
    :reject_if => proc { |ph| ph['number'].blank? },
    :allow_destroy => true

end
