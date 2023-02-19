require 'selenium-webdriver'
require 'cgi'

class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.find(term = '')
    driver = Selenium::WebDriver.for(:chrome)
    full_term = CGI.escape(term + ' ' + self.name.downcase)
    driver.get("https://google.com/?q=#{full_term}")
  end

  def hi
    puts 'Hi! my name is ' + @name
  end
end

class Cat < Animal
end

c = Cat.new('Mr, Buttons')
c.hi

puts Animal.singleton_class

# methods that definition as like class << self or self.hi
# all of this method definition in singleton class.
# what is singleton class? singleton class is hidden object what have all of methods from class for call

#  we want to check all methods from singleton class
# puts Animal.singleton_class.instance_methods

# we can also check with grep
# example:
puts Animal.singleton_class.instance_methods.grep(/find/)

# and also one more fun feature of singleton class it that we can
# use signleton methods of father class in child class.
# exmaple:
puts Cat.singleton_class.instance_methods.grep(/find/)

# we can also add attributes to singleton class
# example:

class Animal
  class << self
    attr_accessor :name
  end
end

# can we connect module to the singleton class ? yes
# example:
module UrlGenerator
  def prepare_url(str)
    CGI.escape(str)
  end
end

class Animal

  class << self
    include UrlGenerator

    def find(term = '')
      driver = Selenium::WebDriver.for(:chrome)
      full_term = prepare_url(term + ' ' + self.name.downcase)
      driver.get("https://google.com/?q=#{full_term}")
    end
  end

end

# or ==

class Animal
  extend UrlGenerator

  class << self
    def find(term = '')
      driver = Selenium::WebDriver.for(:chrome)
      full_term = prepare_url(term + ' ' + self.name.downcase)
      driver.get("https://google.com/?q=#{full_term}")
    end
  end
end

# extend works like include but it works with singleton class

# Modifire ruby Class
# class String
#   def polindrome?
#     self.gsub(/\W/, '').downcase.reverse == self.gsub(/\W/, '').downcase
#   end
# end

# str = "Madam, I'm Adam"
# puts str.polindrome?
# not forget about it! =) but use it if it realy need

# we can also add methods only for object

str = "Madam, I'm Adam"

def str.polindrome?
  self.gsub(/\W/, '').downcase.reverse == self.gsub(/\W/, '').downcase
end

puts str.polindrome?
