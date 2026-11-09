use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
fun t-shirt-cost(message :: String) -> Number:
  doc: "calculates the cost of a messagge on a tshirt ($.20) per character"
  string-length(message) * 0.20
where: t-shirt-cost("Hi") is 0.40
end

# def tshirt_cost(message : str)
