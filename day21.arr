use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
data NumList:
  | nl-empty
  | nl-link(first :: Number, rest :: NumList)
end
nl-empty
nl-link(3, nl-empty)
nl-link(7, nl-link(3, nl-empty))
nl-link(2, nl-link(7, nl-link(3, nl-empty)))

#|
fun num-list-fun(nl :: NumList) -> ???:
  cases (NumList) nl:
    | nl-empty => ...
    | nl-link(first, rest) =>
      ... first ...
      ... num-list-fun(rest) ...
  end
end
|#
fun num-7s(nl :: NumList) -> Number:
  cases (NumList) nl:
    | nl-empty => 0
    | nl-link(first, rest) =>
      if first == 7:
        num-7s(rest) + 1
      else:
        num-7s(rest)
      end
  end
where:
  num-7s(nl-empty) is 0
  num-7s(nl-link(0, nl-empty)) is 0
  num-7s(nl-link(7, nl-empty)) is 1
  num-7s(nl-link(0, nl-link(7, nl-empty))) is 1
  num-7s(nl-link(0, nl-link(7, nl-link(7, nl-empty)))) is 2
end
#Write a data definition called NumListList that represents a list of NumLists, and use the design recipe to write a function total-sum-of-lists that takes a NumListList and produces a NumList containing the sums of the sub-lists.
data NumListist:
  | nll-empty
  | nll-link(first :: NumList, rest :: NumListList)
end
