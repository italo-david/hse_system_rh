module UsersHelper
  OptionsForStatuses = Struct.new(:id, :description)
  OptionsForRoles = Struct.new(:id, :description)

  def options_for_roles
    User.roles_i18n.map do |key, value|
      OptionsForRoles.new(key,value)
    end
  end

  def options_for_status
    User.statuses_i18n.map do |key, value|
    OptionsForStatuses.new(key,value)
    end
  end
  
end
