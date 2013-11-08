class Class
  def new_attr_accessor(*args)
    #I'm going through each argument
    args.each do |arg|

      #Getter. I'm adding a whole method right here. Def starts us off. The name of the getter (ex: .color) is the argument passed in. Then the only thing in the method is the variable plus a @ so our return is the instance variable. (Brian showed me this part.) The only part I don't get is why this works with class_eval and not send. I guess I have to get better with send.

      self.class_eval("def #{arg};@#{arg};end")

      #setter
      self.class_eval("def #{arg}=(val);@#{arg}=val;end")

    end
  end
end




class Cat
  new_attr_accessor :name, :color
end

> cat = Cat.new
> cat.name = "Sally"
> cat.color = "brown"

> cat.name # => "Sally"
> cat.color # => "brown"
