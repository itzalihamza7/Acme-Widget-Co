require_relative '../product'
require_relative '../offer_strategy'
require_relative '../delivery_rules'
require_relative '../basket'

RSpec.describe Basket do
  let(:products) do
    [
      Product.new('R01', 'Red Widget', 32.95),
      Product.new('G01', 'Green Widget', 24.95),
      Product.new('B01', 'Blue Widget', 7.95)
    ]
  end

  let(:delivery_rules) do
    DeliveryRules.new([
      { threshold: 50, cost: 4.95 },
      { threshold: 90, cost: 2.95 }
    ])
  end

  let(:offers) { [RedWidgetOffer.new] }

  def basket_with_codes(*codes)
    basket = Basket.new(products: products, delivery_rules: delivery_rules, offer_strategies: offers)
    codes.each { |code| basket.add(code) }
    basket
  end

  it 'calculates total for B01, G01' do
    expect(basket_with_codes('B01', 'G01').total).to be_within(0.02).of(37.85)
  end

  it 'calculates total for R01, R01' do
    expect(basket_with_codes('R01', 'R01').total).to be_within(0.02).of(54.37)
  end

  it 'calculates total for R01, G01' do
    expect(basket_with_codes('R01', 'G01').total).to be_within(0.02).of(60.85)
  end

  it 'calculates total for B01, B01, R01, R01, R01' do
    expect(basket_with_codes('B01', 'B01', 'R01', 'R01', 'R01').total).to be_within(0.02).of(98.27)
  end
end
