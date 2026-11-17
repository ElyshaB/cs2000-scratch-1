use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
data Games:
  | match-over
  | game(left-points :: Number, right-points :: Number, rest :: Games)
end

data Bracket:
  | player(name :: String)
  | matchup(games :: Games, left :: Bracket, right :: Bracket)
end

semi-1 =
  matchup(game(11, 7, game(5, 11, game(9, 11, match-over))),
    player("Avery"), player("Quinn"))
semi-2 =
  matchup(game(11, 4, game(11, 8, match-over)),
    player("Rowan"), player("Sky"))
tournament =
  matchup(game(11, 9, game(6, 11, game(11, 3, match-over))),
    semi-1, semi-2)

fun left-games(games :: Games) -> Number:
  doc: "returns how many games won by the left player"
  cases (Games) games:
    | match-over => 0
    | game(left, right, rest) => 
      if left > right:
        1 + left-games(rest)
      else: 
        left-games(rest)
      end
  end
where: 
  left-games(match-over) is 0
  left-games(game(11, 7, game(9, 11, match-over))) is 1
  left-games(game(11, 4, game(11, 8, match-over))) is 2
  left-games(game(3, 11, match-over)) is 0
end
  
#2
fun champion(bracket :: Bracket) -> String:
  doc: "returns who won the bracket"
  cases (Bracket) bracket:
    | player(name) => name
    | matchup(games, left, right) => 
      if left-games(games) == 2:
        champion(left)
      else: 
        champion(right)
      end
  end
  
where: 
  champion(player("Sky")) is "Sky"
  champion(semi-1) is "Quinn"
  champion(semi-2) is "Rowan"
  champion(tournament) is "Quinn"
end

#3
fun matchups-won(bracket :: Bracket, player-name :: String) -> Number:
  doc: "returns how many matchups given player has won"
  cases (Bracket) bracket:
    | player(name) => 0
    | matchup(games, left, right) => 
      if champion(bracket) == player-name:
        1 + matchups-won(left, player-name) + matchups-won(right, player-name)
      else: 
         matchups-won(left, player-name) + matchups-won(right, player-name)
      end
  end 
where: 
  matchups-won(tournament, "Quinn") is 2
  matchups-won(tournament, "Rowan") is 1
  matchups-won(tournament, "Avery") is 0
  matchups-won(tournament, "Jo") is 0
  matchups-won(player("Sky"), "Sky") is 0
end

#4
fun runner-up(bracket :: Bracket) -> String:
  doc: "Return name of runner up in matchup"
  cases (Bracket) bracket:
    | player(name) => ""
    | matchup(games, left, right) => 
      if left-games(games) < 2:
        champion(left)
      else: 
        champion(right)
      end
  end
where: 
  runner-up(tournament) is "Rowan"
  runner-up(semi-1) is "Avery"
  runner-up(semi-2) is "Sky"
  runner-up(player("Sky")) is ""
end