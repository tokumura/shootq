json.array!(@bet_winners) do |bet_winner|
  json.extract! bet_winner, :id, :winner_first, :winner_second, :winner_third
  json.url bet_winner_url(bet_winner, format: :json)
end
