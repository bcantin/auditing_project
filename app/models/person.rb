class Person < ActiveRecord::Base

  has_many :phone_numbers, :as => :phoneable, :dependent => :destroy
  
  has_many :employments
  has_many :companies, :through => :employments
  
  audit_enabled :fields => [:first_name, :last_name]
  
  accepts_nested_attributes_for :phone_numbers,
    :reject_if => proc { |ph| ph['number'].blank? },
    :allow_destroy => true
  
  def to_label
    [last_name, first_name].join(', ')
  end
  
end
