json.array!(@tournament_firsts) do |tournament_first|
  json.extract! tournament_first, :id, :match_code, :score_l, :score_r
  json.url tournament_first_url(tournament_first, format: :json)
end
