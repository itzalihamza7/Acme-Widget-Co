class Product
  attr_reader :code, :name, :price

  # Initializes a new product with a code, name, and price
  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end
end
