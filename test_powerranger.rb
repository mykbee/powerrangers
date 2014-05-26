mike = Person.new("Mike")
cat = PowerRanger.new("Cat", "Purple")
zed = EvilNinja.new("Zed")
tom = Person.new("Tom")
kit = PowerRanger.new("Kit", "Orange")
zod = EvilNinja.new("Zod")

mike.run
mike.run
cat.run
zod.run

tom.scream
kit.scream
zod.scream

mike.drink_coffee
mike.drink_coffee(10)

cat.use_megazord(kit)
cat.use_megazord(mike)
cat.use_megazord(zed)
cat.drink_coffee(10)
cat.use_megazord(zed)
zed.inspect 

zed.cause_mayhem(mike)
zed.drink_coffee(10)
zed.cause_mayhem(mike)
zed.kick_puppies(10)
zed.cause_mayhem(mike)
mike.caffeine_level

kit.punch(tom, 10)
kit.rest(100)
kit.punch(tom)
kit.drink_coffee(100)
kit.punch(zod, 6)
kit.punch(cat)
kit.punch(cat, 20)

zed.rest(20)
zed.punch(zod)
zed.punch(tom)
zed.punch(cat, 10)





