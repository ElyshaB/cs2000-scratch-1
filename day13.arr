use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import math as M
import statistics as S

cafe-data =
  table: day :: String, drinks-sold :: Number
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end

sales = get-column(cafe-data, "drinks-sold")
M.max(sales)      # maximum sales
S.mean(sales)     # average sales
M.sum(sales)      # total sold

get-column(cafe-data, "drinks-sold")

sample-list = [list: 10, 20, 30]
empty-list = [list: ]

M.min(get-column(cafe-data, "day"))

M.sum(get-column(cafe-data, "drinks-sold"))

quiz-scores =
  table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end

quiz1-mean = S.mean(get-column(quiz-scores, "quiz1"))
quiz2-mean = S.mean(get-column(quiz-scores, "quiz2"))
quiz3-mean = S.mean(get-column(quiz-scores, "quiz3"))
list1 = [list: 12, 8, 15, 22, 5, 18]
M.min(list1)
M.max(list1)
M.max(list1) - M.min(list1)


