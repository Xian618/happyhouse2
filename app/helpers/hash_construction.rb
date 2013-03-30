module HashConstruction
  def initialize(h = {})
    h.each {|k,v| send("#{k}=",v)}
  end
end
