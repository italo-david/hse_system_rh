module ColaborattorsHelper

  OptionsForGenders = Struct.new(:id, :description)
  OptionsForStatuses = Struct.new(:id, :description)
  OptionsForPendecies = Struct.new(:id, :description)
  OptionsForInstructions = Struct.new(:id, :description)

  def options_for_genders
    Colaborattor.genders_i18n.map do |key, value|
    OptionsForGenders.new(key,value)
    end
  end


  def options_for_status
    Colaborattor.statuses_i18n.map do |key, value|
    OptionsForStatuses.new(key,value)
    end
  end


  def options_for_pendecies
    Colaborattor.pendecies_i18n.map do |key, value|
    OptionsForPendecies.new(key,value)
    end
  end

  def options_for_instructions
    Colaborattor.instructions_i18n.map do |key, value|
    OptionsForInstructions.new(key,value)
    end
  end
end

