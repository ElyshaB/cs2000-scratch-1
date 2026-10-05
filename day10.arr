use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
#lam intro
fun subtract-1(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  n - 1
where:
  subtract-1(10) is 9
  subtract-1(0) is -1
  subtract-1(-3.5) is -4.5
end

fun apply-discounts(t :: Table) -> Table:
  doc: "transforms 'price' column by reducing 20%, if value is below 100"
  transform-column(t, "price", lam(price :: Number) -> Number: 
    if price < 100: price * 0.8 else: price end
  end)
where:
  test-table =
    table: price
      row: 50
      row: 120
      row: 80
      row: 40
    end
  apply-discounts(test-table) is
  table: price
    row: 50 * 0.8
    row: 120
    row: 80 * 0.8
    row: 40 * 0.8
  end
end
prices = table: price
      row: 50
      row: 120
      row: 80
      row: 40
      row: 50
      row: 80
      row: 80
    end
#freq-bar-chart(prices "price")
fun final-price(r :: Row) -> Table:
  doc: "gives price with sales tax"
  wo-tax = get-column(r, "price")
  build-column(wo-tax + (0.05 * wo-tax))
end

