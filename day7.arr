use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv
# csv = comma seperated values
recipes = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end

public-transit = load-table:
  period-financial-year :: String,
  reporting-period :: String,
  days-in-period :: Number,
  period-beginning :: String,
  period-ending :: String,
  bus-journeys :: String,
  underground-journeys :: String,
  DLR-journeys :: String,
  tram-journeys :: String,
  overground-journeys :: String,
  cable-car-jounryes :: String,
  TfL-rail-journeys :: String
  source: csv-table-url("https://data.london.gov.uk/download/ep8ow/06a805f6-77c6-481a-8b08-ddef56afffdd/tfl-journeys-type.csv", default-options)
end
  
  

  
  
  
  
  
  
  
workouts = table: date :: String, activity :: String, duration :: Number, had-protein :: Boolean
  row: "9/21", "run", 30, true
  row: "9/22", "gym", 45, false
  row: "9/23", "bike", 25, true
end
check: 
  table: date :: String, activity :: String, duration :: Number, had-protein :: Boolean
  row: "9/21", "run", 30, true
  row: "9/22", "gym", 45, false
  row: "9/23", "bike", 25, true
end
    is-not 
  table: date :: String, activity :: String, duration :: Number, had-protein :: Boolean
    row: "9/21", "run", 30, false
end
end
