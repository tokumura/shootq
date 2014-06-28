json.array!(@result_tnmtfirsts) do |result_tnmtfirst|
  json.extract! result_tnmtfirst, :id, :match_code, :score_l, :score_r
  json.url result_tnmtfirst_url(result_tnmtfirst, format: :json)
end
