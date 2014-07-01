json.array!(@tournament_seconds) do |tournament_second|
  json.extract! tournament_second, :id, :match_code, :score_l, :score_r, :user_id
  json.url tournament_second_url(tournament_second, format: :json)
end
