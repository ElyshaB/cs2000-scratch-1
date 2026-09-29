use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
fun seat-code(row :: Number, seat :: String) -> String:
  doc: "takes seat # and row and gives full seat"
  num-to-string(row) + string-to-upper(seat)
where: seat-code(2, "d") is "2D"
  seat-code(10, "a") is "10A"
  seat-code(0, "c") is "0C"
end

fun is-aisle(seat :: String) -> Boolean:
  doc: "tells if seat is an aisle seat"
  (string-to-upper(seat) == "A") or (string-to-upper(seat) == "F")
where: is-aisle("f") is true
  is-aisle("c") is false
  is-aisle("a") is true
end

fun is-seat-valid(row :: Number, seat :: String) -> Boolean:
doc: "tells us if seat is valid"
(row >= 1) and (row <= 6) and (string-to-upper(seat) >= "A") and (string-to-upper(seat) <= "F")
where: is-seat-valid(3, "a") is true
  is-seat-valid(7, "b") is false
  is-seat-valid(4, "g") is false
end

fun seat-kind(seat :: String) -> String:
  doc: "tells if seat is window or aisle"
  if is-aisle(seat): "aisle"
  else: "window"
  end
end

fun pass-test(name :: String, row :: Number, seat :: String) -> String:
  doc: "tells if if seat is available and if so what it is"
  if is-seat-valid(row, seat) == false: "seat unavailable"
  else: name + "\n" + seat-code(row, seat) + " " + seat-kind(seat)
  end
where: pass-test("Max Hartert", 5, "b") is "Max Hartert\n5B window"
  pass-test("Elysha B", 7, "a") is "seat unavailable"
end

fun pass-image(name :: String, row :: Number,
    seat :: String) -> Image:
  doc: "image of boarding pass"
  

  