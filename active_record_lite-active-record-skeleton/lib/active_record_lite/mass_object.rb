class MassObject
  # takes a list of attributes.
  # creates getters and setters.
  # adds attributes to whitelist.
  def self.my_attr_accessible(*attributes)
    attributes.each do |name, value|
      @attributes << name
    end
  end

  # returns list of attributes that have been whitelisted.
  def self.attributes
    @attributes ||= []
  end

  # takes an array of hashes.
  # returns array of objects.
  def self.parse_all(results)
  end

  # takes a hash of { attr_name => attr_val }.
  # checks the whitelist.
  # if the key (attr_name) is in the whitelist, the value (attr_val)
  # is assigned to the instance variable.
  def initialize(params = {})
    params.each do |attr_name, value|
      if self.class.attributes.include?(attr_name)
        value.send(self.class.attributes)
      else
        raise ArgumentError.new "mass assignment to unregistered attribute #{attr_name}"
      end
    end
  end
end