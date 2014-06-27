json.array!(@result_seconds) do |result_second|
  json.extract! result_second, :id, :group_name, :countries
  json.url result_second_url(result_second, format: :json)
end
