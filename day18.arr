use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv 
data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end

the-dispossessed = book("The Dispossessed", "Ursula K. Le Guin", 387)
to-the-lighthouse = book("To the Lighthouse", "Virginia Woolf", 209)
brave-new-world = book("Brave New World", "Aldous Huxley", 268)

the-dispossessed.pages # evaluates to 387

fun is-long-book(b :: BookRecord) -> Boolean:
  doc: "tells if a book has more than 350 pages"
  if b.pages < 350:
    true
  else: false
  end
end

data Podcast:
  | pod(title :: String, host :: String, length-in-mins :: Number)
end


recipes-raw = load-table:
  title :: String,
  servings :: String,
  prep-time :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end
recipes-with-servings = transform-column(recipes-raw, "servings", string-to-number-default(0))
recipes = transform-column(recipes-with-servings, "prep-time", string-to-number-default(0))

data Recipe:
  | recipe(title :: String, cooking-time :: Number, servings :: Number)
end

row3 = get-row(recipes, 2)
r1 = recipe(get-column(row3, "title"), get-column(row3, "cooking-time"), get-column(row3, "servings"))