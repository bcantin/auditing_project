class Company < ActiveRecord::Base
  belongs_to :industry
  has_many :phone_numbers, :as => :phoneable
  audit_enabled
  
  accepts_nested_attributes_for :phone_numbers,
    :reject_if => proc { |ph| ph['number'].blank? },
    :allow_destroy => true
    
end
rake rails:template LOCATION=http://github.com/lleger/Rails-3-jQuery/raw/master/jquery.rb

