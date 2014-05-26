module Fight
  def punch(person, strength=1)
  	if self.class == person.class
  	  puts "#{@name} can't punch another #{person.class}..."
  	elsif (strength <= @strength && strength >= 5) && caffeine_level >= 1
  	  puts "#{person.name} was somersaulted into the air after an incredible punch from #{@name}!"
  	  @strength -= strength
  	  @caffeine_level -= 2
  	elsif strength <= @strength && @caffeine_level >= 1
  	  puts "#{@name} punched #{person.name}!"
  	  print "#{person.scream}", "#{person.run}"
  	  @strength -= strength
  	  @caffeine_level -= 1
  	elsif strength > @strength
  	  puts "#{@name} is a lightweight and needs to rest up."
  	else
  	  puts "#{@name} needs more caffeine"
  	end
  end

  def rest(number=1)
    if number > 1
      @strength += number
      puts "#{@name} rested for #{number} minutes and increased strength to #{@strength}."
    else
      @strength += 1
      puts "#{@name} rested and increased strength by one to #{@strength}."
    end
  end
end

class Person
  attr_reader :name
  attr_accessor :caffeine_level
  
  def initialize(name, caffeine_level=1)
  	@name = name
  	@caffeine_level = caffeine_level
  end

   def run
     if @caffeine_level == 0
       puts "#{@name} tried to run, but was too tired."
     else
       puts "#{@name} is running away."
       @caffeine_level -= 1
     end
   end

   def scream
     puts "#{@name} screamed Blerg!!"
   end

   def drink_coffee(number=1)
     @caffeine_level += number
     puts "#{@name}'s caffeine level increased by #{number} to #{@caffeine_level}."
   end
end

class PowerRanger < Person
  include Fight
  attr_reader :color
  attr_accessor :strength

  def initialize(name, color, caffeine_level=1, strength=1)
  	super(name, caffeine_level)
  	@strength = strength
  	@color = color
  end

  def use_megazord(person)
    if person.class == EvilNinja
      if @caffeine_level >= 1
        @strength += 5000
        puts "MEGAZORD!!!"
        puts "#{@name} defeated EvilNinja #{person.name} using Megazord attack."
        puts "#{person.name} lost caffeine, strength, and evilness."
        person.caffeine_level = 0
        person.strength = 0
        person.evilness = 0
        @strength -= 5000
        @caffeine_level -= 1
      else
        puts "Need...more...caffeine..."
      end
    elsif person.class == PowerRanger
      puts "#{@name} can't use that attack on another #{person.class}."
    else person.class == Person
      puts "#{@name} can't use that attack on a citizen. For shame!"
    end
  end
end

class EvilNinja < Person
  include Fight
  attr_accessor :strength, :evilness

  def initialize(name, caffeine_level=1, strength=1, evilness=1)
  	super(name, caffeine_level)
  	@strength = strength
  	@evilness = evilness
  end

  def cause_mayhem(person, evilness=2)
  	if @evilness >= 2 && @caffeine_level >= 1
  	  puts  "#{person.name} was robbed of caffeine by #{@name} causing mayhem!"
  	  person.caffeine_level = 0
  	  @caffeine_level -= 1
  	  @evilness -= 2
  	elsif @caffeine_level < 1
  	  puts "#{@name} isn't caffeinated enough to cause mayhem."
  	else
  	  puts "#{@name} isn't evil enough to cause mayhem."
  	end
  end

  def kick_puppies(number=1)
  	if number == 1
  	  @evilness += 1
  	  puts "#{@name} kicked one puppy and increased evilness to #{@evilness}."
  	else
  	  @evilness += number
  	  puts "#{@name} kicked #{number} puppies to increase evilness to #{@evilness}."
  	end
  end
end

def fight_scene(ranger1, ranger2, ninja1, ninja2, person1, person2)
  ranger1.rest(50)
  ranger1.drink_coffee(50)
  ranger1.punch(ninja1, 5)
  ranger1.punch(person1)
  ranger2.rest(50)
  ranger2.drink_coffee(50)
  ranger2.use_megazord(ninja2)
  ninja1.rest(20)
  ninja1.drink_coffee(10)
  ninja1.cause_mayhem(person1)
  ninja2.drink_coffee(5)
  ninja2.punch(person2)
  person1.scream
  person1.drink_coffee(10)
  person2.run
  person2.drink_coffee(5)
end
