require_relative 'product'
require_relative 'offer_strategy'
require_relative 'delivery_rules'
require_relative 'basket'

products = [
  Product.new('R01', 'Red Widget', 32.95),
  Product.new('G01', 'Green Widget', 24.95),
  Product.new('B01', 'Blue Widget', 7.95)
]

delivery_rules = DeliveryRules.new([
  { threshold: 50, cost: 4.95 },
  { threshold: 90, cost: 2.95 }
])

offers = [RedWidgetOffer.new]

basket = Basket.new(products: products, delivery_rules: delivery_rules, offer_strategies: offers)

ARGV.each do |code|
  basket.add(code)
end

puts "Total: $#{basket.total}"
