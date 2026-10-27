use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
data PaymentMethod:
  | cash
  | credit(card-number :: String, expiry :: String)
  | checking(bank-account :: String, routing :: String, check-number :: Number)
end
payment-1 = cash
payment-2 = credit("1111-2222-3333-4444", "09/26")
payment-3 = checking("987654321", "111", 55)

payment-2.expiry

fun display-payment(p :: PaymentMethod) -> String:
  cases (PaymentMethod) p:
    | cash => "Paid in cash"
    | credit(cn, exp) => "Paid by credit card expiring on " + exp
    | checking(acc, rout, num) => "Paid by check from account " + acc
  end
end
#exercise
data Vehicle:
  | bike
  | car(make :: String, year :: Number)
  | truck(make :: String, year :: Number, capacity :: Number)
end
vehicle1 = bike
vehicle2 = car("Hyundai", 2019)
vehicle3 = truck("Ram", 1999, 5)
fun vehicle-age(v :: Vehicle, cur-year :: Number) -> Number:
  cases (Vehicle) v:
    | bike => 0
    | car(make, year) => cur-year - year
    | truck(make, year, cap) => cur-year - year
  end
end
data Grade:
  | letter(g :: String)
  | percent(p :: Number)
  | pass-fail(ps :: String)
end
#fun grade-to-gpa(grade :: Grade) -> Number:
# cases (Grade) grade:
data WeatherReport:
  | sunny(temp :: Number)
  | rainy(temp :: Number, prec :: Number)
  | snowy(temp :: Number, prec :: Number, wind-sp :: Number)
end
fun is-severe(w :: WeatherReport) -> Boolean:
  doc: "returns true if weather is severe"
  cases (WeatherReport) w:
    | sunny(t) => t . 95
    | rainy(t, p) 
where:
  is-severe(sunny(100)) is true
  is-severe(rainy(79, 2) is false
    is-severe(snowy(70, 1, 58)) is true
end
    