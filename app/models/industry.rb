class Industry < ActiveRecord::Base
  has_many :companies
  
  def to_label
    name
  end
end
