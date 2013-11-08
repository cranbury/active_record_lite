require "new_attr_accessor/new_attr_accessor"



class MassObject



  def self.my_attr_accessible(*attributes)
    #Iterates through attributes
    #Store the array of attributes in a class instance variable  @attributes
  end
  #Do these go here?
  def new_attr_accessor(*arguments)
    arguments.each do |argument|
      self.class_eval("def #{argument};@#{argument};end")
      self.class_eval("def #{argument}=(val);@#{argument}=val;end")
    end
  end

  def initialize(params)
    params.each do |attr_name, value|
      if self.attributes.include?(attr_name) #bad? .all seems wrong too
        send(self.attributes) #should this be MassObject.attributes?
      else
        raise ArgumentError.new "mass assignment to unregistered attribute #{attr_name}"
      end
    end
  end

  #getters
  def self.attributes
    @attributes||={}
  end

  #setters
  def self.attributes(attr_name, value)
    @attributes[attr_name] = value
  end

end

class MyClass < MassObject
  my_attr_accessible :x, :y
  my_attr_accessor :x, :y
end
