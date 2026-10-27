use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L
#sum is already built in...but this is how it would look
fun my-sum(num-list :: List<Number>) -> Number block:
  var total = 0
  for each(n from num-list):
    total := total + n
  end
  total
where:
  my-sum([list: 0, 1, 2, 3]) is 6
end

fun my-product(num-list :: List<Number>) -> Number block:
  var total = L.get(num-list, 0) 
  for each(n from num-list):
    total := total * n
  end
  total
where: my-product([list: 1, 3, 6]) is 18
end
fun sum-even-numbers(num-list :: List<Number>) -> Number block:
  var total = 0
  for each(n from num-list):
    if (num-modulo(n, 2) == 0):
      total := total + n
    else: total
    end
  end
  total
where: sum-even-numbers([list: 2, 3 ,4]) is 6
end
fun all-short-words(word-list :: List<String>) -> Boolean block:
  var tf = true
  for each(s from word-list):
    if string-length(s) <= 4:
      tf := tf
    else: tf := false
    end
  end
  tf
where: all-short-words([list: "hi", "hey", "hello"]) is false
  all-short-words([list: "elysha", "is", "here"]) is false
end
fun concat-all(string-list :: List<String>) -> String block:
  var word = ""
  for each(s from string-list):
    word := word + s
  end
  word
where: concat-all([list: "hi", "hey"]) is "hihey"
end
fun reverse-list(reg-list :: List<String>) -> String block:
  var element = L.get(reg-list, 0)
  for each(s from reg-list):
    element := L.push(element, s)
  end
  element
where: reverse-list([list: "hi", "hey"]) is [list: "hey", "hi"]
end