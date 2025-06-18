class DeliveryRules
  def initialize(rules)
    @rules = rules.sort_by { |rule| rule[:threshold] }
  end

  def calculate(total)
    @rules.each do |rule|
      return rule[:cost] if total < rule[:threshold]
    end
    0.0
  end
end