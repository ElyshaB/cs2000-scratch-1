use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv
orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end
high-value-orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "10:15", 8.00
end
fun is-high-value(r :: Row) -> Boolean:
  doc: "returns whether the amount column is >= 5"
  get-column(r, "amount") >= 5.0
where:
  is-high-value(get-row(orders, 2)) is true
  is-high-value(get-row(orders, 3)) is false
end
new-high-orders = filter-with(orders, is-high-value)
order-by(orders, "time", true)
fun is-morning( r :: Row) -> Boolean:
  doc: "sees if the order was in the morning"
  get-column(r, "time") <= "12:00"
end
morning-table = filter-with(orders, is-morning)
latest-earliest = order-by(morning-table, "time", false)

table = load-table: location :: String, subject :: String, date :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv", default-options)
end
fun has-forest(r :: Row) -> Boolean:
  doc: "tells us if a row has forest"
  get-column(r, "subject") == "Forest"
end
forest-table = filter-with(table, has-forest)