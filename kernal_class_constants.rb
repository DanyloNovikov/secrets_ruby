# create class animal

# BasicObject is the root of all classes in Ruby. He did have most methods
# that are available in the Object class. for example if we create instans of
# class Animal we did not see instans of that class in console backlog becase BasicObject
# BasicObject did have method "inspect".
# class Animal < BasicObject
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def modify_name
#     puts 'Enter new name'
#   end
# end

# Animal.new('cat').modify_name
# puts not working? why? because we did not have method puts in BasicObject
# and we did not have method puts in Object class but in Object class we have
# include module Kernel and in Kernel we have method puts

# so lets include module Kernel in our class Animal and try again
# class Animal < BasicObject
#   include Kernel
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def modify_name
#     puts 'Enter new name'
#   end
# end

# Animal.new('cat').modify_name

# lets check all classes 
class Animal
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end

puts a = Animal.new('cat')
puts a.class
puts a.class.class
puts a.class.class.superclass

# Animal -> inherits -> Object -> inherits -> BasicObject
# but Animal is class of Class and Class is class of Module
# like this...

# about constants and name of class
# class Animal --> is just a constant

class Animal
  # TEST is constant in a class
  TEST = 'test'
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
end

klass = Animal
object = klass.new('kat')
object.inspect
# it becase name of class is constant
#  we canot change something in this constant
# they just a link to class in memory

# link in class in constant
puts Animal::TEST