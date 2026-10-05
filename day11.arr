use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
  source: csv-table-file("voters.csv", default-options)
end

filter-with(voter-data, lam(r :: Row) -> Boolean: get-column(r, "Party") == "Republican" end)
fun blank-to-indep(s :: String) -> String:
  doc: "replaces an empty string with Independent"
  if s == "":
    "Independent"
  else:
    s
  end
where:
  blank-to-indep("") is "Independent"
  blank-to-indep("blah") is "blah"
end
voters-with-indep = transform-column(voter-data, "Party", blank-to-indep)
