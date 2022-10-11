# pet_hotel.rb

class PetHotel
    def initialize(name)
        @name = name
        @guests = []
    end

    def check_in(guest)
        @guests << guest
    end
end

class Cat
    def initialize(name)
        @name = name
    end
end

hotel = PetHotel.new("Animal Inn")

cat_1 = Cat.new("Sennacy")
cat_2 = Cat.new("Whiskers")

hotel.check_in(cat_1)
hotel.check_in(cat_2)

p hotel
# <PetHotel:0x007fb1ce1e91f0
#   @name="Animal Inn",
#   @guests=[
#     #<Cat:0x007fb1ce1e9060 @name="Sennacy">,
#     #<Cat:0x007fb1ce1e8f48 @name="Whiskers">
#   ]
# >