module Findable
   def find_by_name(name)
    self.all.detect{|a| a.song == name}
  end
  
  def find_or_create_by_name(name)
    self.find_by_name(name) ? self : self.create(name)
  end
end