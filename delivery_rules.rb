class DeliveryRules
  def initialize(rules)
    # Initialize with a list of delivery rules
    raise ArgumentError, "Rules must be an array" unless rules.is_a?(Array)
    raise ArgumentError, "Each rule must be a hash with :threshold and :cost" unless rules.all? { |rule| rule.is_a?(Hash) && rule.key?(:threshold)}
    @rules = rules.sort_by { |rule| rule[:threshold] }
  end

  def calculate(total)
    # Calculate the delivery cost based on the total amount
    raise ArgumentError, "Total must be a numeric value" unless total.is_a?(Numeric) && total >= 0

    return 0.0 if total <= 0
    @rules.each do |rule|
      return rule[:cost] if total < rule[:threshold]
    end
    0.0
  end
end