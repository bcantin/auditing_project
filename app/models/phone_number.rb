class PhoneNumber < ActiveRecord::Base
  belongs_to :phoneable, :polymorphic => true
  audit_relationship_enabled
end
