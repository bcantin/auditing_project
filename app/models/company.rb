class Company < ActiveRecord::Base
  belongs_to :industry
  audit_enabled
end
