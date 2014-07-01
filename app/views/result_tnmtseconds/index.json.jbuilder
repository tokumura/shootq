json.array!(@result_tnmtseconds) do |result_tnmtsecond|
  json.extract! result_tnmtsecond, :id, :match_code, :score_l, :score_r
  json.url result_tnmtsecond_url(result_tnmtsecond, format: :json)
end
