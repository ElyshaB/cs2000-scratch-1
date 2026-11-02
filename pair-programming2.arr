use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L
import math as M
fun counted-pages(pages :: Number) -> Number:
  doc: "total pages that count for a given day"
  if pages <= 50:
    pages
  else: 50
  end
where: counted-pages(45) is 45
  counted-pages(80) is 50
end
#2
fun counted-log(log :: List<Number>) -> List<Number>:
  doc: "gives a list of pages that count for each day"
  L.map(counted-pages, log)
where: counted-log([list: 3, 78, 43]) is [list: 3, 50, 43]
end
#3
fun finish-day(log :: List<Number>, pages :: Number) -> Number block:
  doc: "returns the # of days taken to finish the book or 0 if unfinished"
  var x = 0
  var y = 0
  for each(l from counted-log(log)) block:
    if M.sum(counted-log(log)) < pages block:
      0
    else if (y < pages):
      x := x + 1
    else if l > pages:
      1
    else: x
    end
    y := y + l
  end
  x
where: finish-day([list: ], 100) is 0
  finish-day([list: 30, 30, 30], 100) is 0
  finish-day([list: 60, 20, 40], 100) is 3
  finish-day([list: 10, 80, 10], 60) is 2
  finish-day([list: 100], 50) is 1
end
#4
october = table: date :: String, pages :: Number
  row: "Oct 1", 20
  row: "Oct 2", 75
  row: "Oct 3", 0
  row: "Oct 4", 40
  row: "Oct 5", 30
end
fun book-status(t :: Table, pages :: Number) -> String:
  doc: "gives a line telling book status"
  if M.sum(get-column(t, "pages")) >= pages:
    "Finished on day " + num-to-string(finish-day(get-column(t, "pages"), pages))
  else: pages - M.sum(counted-log)
  end
where: book-status(october, 100) is "Finished on day 4"
end
#5
fun book-stack(log :: List<Number>) -> Image block:
  doc: "image of rectangles for each day read"
  var n = empty-image
    for each(x from counted-log(log)):
    n := above(rectangle(20, 4 * x, "solid", "green"), n)
  end
  n
end
    
  
    
