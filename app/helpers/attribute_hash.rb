module AttributeHash
  def to_hash
    hash = {}; 
    self.instance_variables.each { |k|
      hash[k] = instance_variable_get(k)
    }
    return hash
  end
end