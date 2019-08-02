module Music
  
  module ClassMethods
    def self.all
      @@all
    end
  
    def self.destroy_all
      @@all.clear
    end
  
    def self.create(name)
      self.new(name)
    end
  end
  
  module InstanceMethods
    def initialize(name)
      @name = name
      save
      self
    end
    
    def save
    @@all << self
    end
  end
  
end