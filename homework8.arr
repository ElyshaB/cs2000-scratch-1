use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
#PROBLEM 1
fun count-until-failing(grades :: List<Number>) -> Number block:
  doc: "counts # of grades that appear before first failing grade"
  cases (List) grades:
    | empty => 0
    | link(first-grade, rest-grades) => 
      if first-grade < 60:
        0
      else: 1 + count-until-failing(rest-grades)
      end
  end
where: count-until-failing([list: 80, 97, 43]) is 2
  count-until-failing([list: 100, 20, 56]) is 1
end


# PROBLEM 2
fun valid-grade-sum(grades :: List<Number>) -> Number block:
  doc: "returns a sum of grades and -1 if any are invalid"
  cases (List) grades:
    | empty => 0
    | link(first, rest) => 
      if (0  > first) or (100 < first):
        -1
      else: 
        if valid-grade-sum(rest) == -1:
          -1
        else: first + valid-grade-sum(rest)
        end
      end
      end
where: valid-grade-sum([list: 2, 68, -1]) is -1
  valid-grade-sum([list: 54, 72, 90]) is 216
end

# PROBLEM 3
fun grades-before-target(grades :: List<Number>, target :: Number) -> List<Number> block:
  doc: "returns list of grades before target grade hit"
  cases (List) grades:
    | empty => [list: ]
    | link(first, rest) =>
      if first == target:
        [list: ]
      else: link(first, grades-before-target(rest, target))
      end
  end
where: grades-before-target([list: 67, 32, 73, 89, 80], 80) is [list: 67, 32, 73, 89]
end


# PROBLEM 4
fun negate-until-zero(num-list :: List<Number>) -> List<Number>:
  doc: "-1 times each number until the next 0 or the end of the list."
  cases (List) num-list:
    | empty => empty
    | link(first, rest) =>
      if first == 0:
        empty
      else:
        link(-1 * first, negate-until-zero(rest))
      end
  end
where:
  negate-until-zero([list: ]) is [list: ]
  negate-until-zero([list: 3, 0, 5]) is [list: -3]
  negate-until-zero([list: 3, 4]) is [list: -3, -4]
end

fun transform-numbers(num-list :: List<Number>) -> List<Number>:
  doc: "Keeps numbers before the first 0, -1 times numbers between the first and second 0."
  cases (List) num-list:
    | empty => empty
    | link(first, rest) =>
      if first == 0:
        negate-until-zero(rest)
      else:
        link(first, transform-numbers(rest))
      end
  end
where:
  transform-numbers([list: ]) is [list: ]
  transform-numbers([list: 1, 3, 0, 4, 5, 6, 0, 7, 8, 9]) is [list: 1, 3, -4, -5, -6]
end
