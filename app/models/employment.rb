class Employment < ActiveRecord::Base
  
  belongs_to :person
  belongs_to :company
  
  audit_relationship_enabled
  
end
