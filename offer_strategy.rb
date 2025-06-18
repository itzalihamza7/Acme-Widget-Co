class OfferStrategy
  def apply(items)
    0.0
  end
end

class RedWidgetOffer < OfferStrategy
  def apply(items)
    discount = 0.0
    red_widgets = items.select { |p| p.code == 'R01' }
    return 0.0 if red_widgets.size < 2
    red_widgets.sort_by!(&:price) # Safety in case prices differ
    pairs = red_widgets.size / 2
    discount = pairs * (red_widgets.first.price / 2.0)
    discount
  end
end