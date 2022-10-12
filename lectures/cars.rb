class Car

    attr_accessor :year, :price
    attr_reader :brand, :model, :category, :seats

    def initialize(brand, model, year, category, price, versions, seats=5)
        @brand = brand
        @model = model
        @year = year
        @category = category
        @price = price
        @seats = seats
        @versions = versions
    end

    def change_price(value)
        self.price = value
    end

    def aging
        self.year -= 1
    end

    def inflation
        self.price *= 1.08
    end

    def ==(other_car)
        self.brand == other_car.brand
    end

    def [](position)
        @versions[position]
    end
    
    def []=(position, ele)
        @versions[position] = ele
    end

end

tesla_model3 = Car.new("Tesla","Model 3",2022, "sedan",75000, ["Long range","Performance"])
tesla_modelX = Car.new("Tesla","Model X",2022, "SUV",100000,["Standard","Long range","Plaid"],6)
p tesla_model3
p tesla_modelX

p tesla_model3.price
tesla_model3.inflation
p tesla_model3.price
p tesla_model3 == tesla_modelX
p tesla_model3[0]
tesla_model3[0] = "Long Range"
p tesla_model3[0]