json.array!(@user_infos) do |user_info|
  json.extract! user_info, :id, :name, :point_first, :point_second, :point_third, :point_total
  json.url user_info_url(user_info, format: :json)
end
