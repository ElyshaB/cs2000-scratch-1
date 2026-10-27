use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L
import math as M
include csv
discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

unique-codes = L.distinct(discount-codes)

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = L.filter(is-real-code, unique-codes)
first-code = L.get(real-codes,0)

lower-codes = L.map(string-to-lower, real-codes)

upper-codes = L.map(string-to-upper, real-codes)

survey-responses = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]
lower-responses = L.map(string-to-lower, survey-responses)

unique-response = L.distinct(lower-responses)

fun is-not-maybe(response :: String) -> Boolean:
  not(response == "maybe") 
end

real-responses = L.filter(is-not-maybe, unique-response)

  products =
  table: name :: String, price :: Number
    row: "laptop", 999.99
    row: "mouse", 25.50
    row: "keyboard", 75.00
    row: "monitor", 299.99
  end
prices = get-column(products, "price")

fun under-100(price :: Number) -> Boolean:
  not(price > 100)
end
fun discount(n :: Number) -> Number:
  n * 0.90
end
prices-under-100 = L.filter(under-100, prices)
discounted = L.map(discount, prices-under-100)

fruit-list = [list: "apple", "banana", "cherry", "date", "elderberry"]
L.get(fruit-list, 2)

fun over-5(fruit :: String) -> Boolean:
  not(string-length(fruit) <= 5)
end
L.filter(over-5, fruit-list)

boston-employees = load-table: 
  csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv", default-options)