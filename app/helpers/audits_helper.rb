module AuditsHelper

  def description(audit)
    str = case audit.action
    when 'created'
      "Created Record #{audit.auditable_type}"
    when 'updated'
      if audit.association.blank?
        if audit.field_name.end_with?('_id')
          "Old: #{get_belongs_to(audit, audit.old_value)} <br/>" +
          "New: #{get_belongs_to(audit, audit.new_value)}"
        else
          "Old: #{audit.old_value} <br/>" +
          "New: #{audit.new_value}"
        end
      else
        # {:old_value  => get_has_many(old_value),
        #  :new_value  => get_has_many(new_value)}
      end
    when 'added'
      # {:old_value  => get_has_many(old_value),
      #  :new_value  => get_has_many(new_value),
      #  :field_name => association_type}
    when 'removed'
      # {:field_name => association_type}
    end
    
    str.html_safe
  end

  def get_has_many(value)
    return nil unless value
    "#{field_name} => #{value}"
  end

  ##
  # For a belongs_to association, we only store the ID of what is being
  # refered to (:industry_id => 5).  We cannot guess what would be relevant
  # to actually show for the value.  We recommend implementing a #to_label
  # method and/or overriding this method to display what is relevant to
  # your application.
  #
  # EG:
  #   class Industry < ActiveRecord::Base
  #     has_many :companies
  #
  #     def to_label
  #       name
  #     end
  #   end

  def get_belongs_to(audit, value)
    return nil unless value
    klass = audit.field_name.gsub(/_id$/,'').capitalize.constantize
    value = klass.where(:id => value).first
    return 'Unknown' unless value
    return value.to_label 
  end


  # def description(audit)
  #   str = case audit.action
  #   when 'created'
  #     "Created #{@resource.class.human_name}"
  #   when 'added'
  #     "Add "
  #     #   "<strong>Add</strong> <span class='new'>#{association_link audit.implied_association}</span>"
  #   when 'updated'
  #     if audit.association.present?      
  # 
  #     elsif audit.field_name =~ /_id$/ && assoc = find_assoc(audit.field_name)
  #       old_assoc = assoc.find(audit.old_value) if audit.old_value
  #       new_assoc = assoc.find(audit.new_value) if audit.new_value
  #       "Old: #{assoc_link(old_assoc)}<br/>New: #{assoc_link(new_assoc)}"
  #     else
  #       "Old: #{audit.old_value}<br/>New: #{audit.new_value}"
  #     end
  #   # when "Add"
  #   #   "<strong>Add</strong> <span class='new'>#{association_link audit.implied_association}</span>"
  #   # when "Remove"
  #   #   "<strong>Remove</strong> <span class='old'>#{association_link audit.implied_association}</span>"
  #   when 'removed'
  #     'removed'
  #   end
  #   
  #   str.html_safe
  # end
  # 
  # def find_assoc(field)
  #   @resource.class.reflect_on_all_associations(:belongs_to).detect {|r| r.primary_key_name == field}.klass
  # end
  # 
  # # the most common attribute is name
  # def assoc_link(record)
  #   return blank unless record
  #   
  #   return record.name if record.try(:name)
  #   
  # end

end
