json.array!(@result_firsts) do |result_first|
  json.extract! result_first, :id, :match_date, :dayofweek, :match_time, :group_name, :match_code, :score_l, :score_r
  json.url result_first_url(result_first, format: :json)
end
