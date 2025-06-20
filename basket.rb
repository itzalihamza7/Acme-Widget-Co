require_relative 'product'
require_relative 'offer_strategy'
require_relative 'delivery_rules'


# Represents a shopping basket that contains products, applies offers, and calculates total price with delivery
class Basket
  def initialize(products:, delivery_rules:, offer_strategies: []) 
    @products_catalog = products 
    @delivery_rules = delivery_rules 
    @offer_strategies = offer_strategies 
    @items = []
  end


# Adds a product to the basket
  def add(product_code)
    product = @products_catalog.find { |p| p.code == product_code }
    raise "Product code #{product_code} not found" unless product
    @items << product
  end

# Calculates the total price with discounts and delivery
  def total
    subtotal = @items.sum(&:price)
    total_discount = @offer_strategies.sum { |strategy| strategy.apply(@items) }
    delivery = @delivery_rules.calculate(subtotal - total_discount)
    (subtotal - total_discount + delivery).round(2)
  end
end
