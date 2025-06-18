# Acme Widget Co – Shopping Basket

A simple Ruby command-line app that calculates the total cost of a shopping basket, including product discounts and delivery charges.

---

## 🛒 Products

| Name         | Code | Price   |
|--------------|------|---------|
| Red Widget   | R01  | $32.95  |
| Green Widget | G01  | $24.95  |
| Blue Widget  | B01  | $7.95   |

---

## 🚚 Delivery Rules

- Total < $50 → $4.95  
- Total < $90 → $2.95  
- Total ≥ $90 → Free  

---

## 🎁 Offer

- **Red Widget (R01)**: Buy one, get the second at **half price**

---

## ▶️ How to Use

1. Ensure you have Ruby installed (`ruby -v`).
2. Run the program with product codes as arguments:

```bash
ruby main.rb R01 R01
# Output: Total: $54.37
```

---

## 📁 File Overview

- `product.rb` – Product definition
- `offer_strategy.rb` – Offer strategy base and Red Widget offer logic
- `delivery_rules.rb` – Delivery calculation logic
- `basket.rb` – Main basket class (adds items, computes total)
- `main.rb` – Entry point script
- `spec/` – RSpec test cases
- `README.md` – This file

---

## ✅ Assumptions

- Offers apply in pairs (e.g. 2 R01 → one at half price).
- Offers apply only to eligible products; extensible via strategy pattern.
- Delivery is applied after discounts.
- Product codes are assumed to be valid — an error is raised if not found.
- Totals are rounded to 2 decimal places using `Float#round`.

---

## 🧪 Running Tests

Ensure `rspec` is installed:

```bash
gem install rspec
```

Then run:

```bash
rspec
```

All pricing scenarios are covered in `spec/basket_spec.rb`.

---

## 💡 Notes

- The system is modular and easily extendable for new products, offers, or delivery rules.
- Focus was placed on clean architecture, separation of concerns, and readability.
