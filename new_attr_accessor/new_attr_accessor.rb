class Class
  def new_attr_accessor(*args)
    #I'm going through each argument
    args.each do |arg|

      #Getter.
      self.class_eval("def #{arg};@#{arg};end")

      #setter
      self.class_eval("def #{arg}=(val);@#{arg}=val;end")

    end
  end
end


# class MassObject
#
# end


class Cat
  new_attr_accessor :name, :color
end

> cat = Cat.new
> cat.name = "Sally"
> cat.color = "brown"

> cat.name # => "Sally"
> cat.color # => "brown"
