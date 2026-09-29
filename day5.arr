use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
fun add-shipping(order-amt :: Number) -> Number:
  doc: "add shipping costs to order total"
  if order-amt <= 10:
    order-amt + 4
  else if order-amt <= 30: # same as (order-amt > 10) and (order-amt <= 30):
    order-amt + 8
  else:
    order-amt + 12
  end
where: 
  add-shipping(10) is 10 + 4
  add-shipping(70) is 70 + 12
  add-shipping(15) is 15 + 8
end
"this" > "that"
fun buy-tickets3(num-tickets :: Number, is-senior :: Boolean)
  -> Number:
  doc: ```Compute the price of tickets at $10 each with
       discount of 15% for more than 5 tickets
       or being a senior```
  if is-senior == true:
    num-tickets * 10 * 0.85
  else:
    if num-tickets > 5:
      num-tickets * 10 * 0.85
    else:
      num-tickets * 10
    end
  end
where:
  buy-tickets3(0, false) is 0
  buy-tickets3(0, true) is 0
  buy-tickets3(2, false) is 2 * 10
  buy-tickets3(2, true) is 2 * 10 * 0.85
  buy-tickets3(6, false) is 6 * 10 * 0.85
  buy-tickets3(6, true) is 6 * 10 * 0.85
end
fun buy-tickets4(num-tickets :: Number, is-senior :: Boolean)
  -> Number:
  doc: ```Compute the price of tickets at $10 each with
       discount of 15% for more than 5 tickets
       or being a senior```
  if (is-senior) or (num-tickets > 5): #is-senior OR is-senior == true
    num-tickets * 10 * 0.85
  else:
    num-tickets * 10
  end
end
#in-class exercises 
fun choose-hat(temp-in-F :: Number) -> String:
  doc: "determines appropriate head gear, with above 80F a sun hat, below 50F a winter hat, else nothing"
  spy:
    temp-in-F,
    comparison: temp-in-F > 80
  end
   spy: 
      temp-in-F,
      comparison: temp-in-F < 60
    end
  if temp-in-F > 80:
    "sun hat"
  else if temp-in-F < 60:
    "winter hat"
  else:
    "no hat"
  end
where:
  choose-hat(50) is "winter hat"
  choose-hat(85) is "sun hat"
  choose-hat(80) is "no hat"
end
fun add-glasses(outfit :: String) -> String:
  doc: "adds glasses to any outfit"
  outfit + ", add glasses"
where: add-glasses("jeans and a t-shirt") is "jeans and a t-shirt, add glasses"
end
# design recipe: 1. fun name and input/output types, 2. add doc string, 3. tests (where:), 4. write code
fun ec1(s :: String) -> String:
string-to-upper(s)
end