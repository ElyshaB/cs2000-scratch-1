use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L
#initialize, iterate, update
fun my-doubles(num-list :: List<Number>) -> List<Number> block:
  doc: "returns a new list with each value doubled"
  var x = [list:  ]
  for each(n from num-list):
    x := L.append(x, [list: n * 2])
    end
    x    
    where: my-doubles([list: 2, 3, 5]) is [list: 4, 6, 10]
  end

# L.map(lam(n :: Number) -> Number: n * 2 end, num-list)

fun my-string-lens(l :: List<String>) -> List<Number> block:
  doc: "returns a new list with string lengths"
  var result = [list:  ]
  for each(word from l):
    result := result + [list: string-length(word)]
  end
  result  
where: my-string-lens([list: "hi", "bye"]) is [list: 2, 3]
end

L.map(string-length, [list: "hi", "bye"])


fun my-alternating(l :: List) -> List block:
  doc: "returns a list with every other element"
  var result = [list:  ]
    for each(element from l):
    if L.get(l, 0) or L.get(l, 0 + (2 * n)) result := 
  end
  result
where: my-doubles([list: 1, 2, 3, 4, 5]) is [list: 1, 3, 5]
end
