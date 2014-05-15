json.array!(@bet_firsts) do |bet_first|
  json.extract! bet_first, :id, :match_code, :score, :user_id
  json.url bet_first_url(bet_first, format: :json)
end
