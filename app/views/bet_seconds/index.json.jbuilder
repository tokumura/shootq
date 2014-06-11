json.array!(@bet_seconds) do |bet_second|
  json.extract! bet_second, :id, :a1, :a2, :b1, :b2, :c1, :c2, :d1, :d2, :e1, :e2, :f1, :f2, :g1, :g2, :h1, :h2, :user_id
  json.url bet_second_url(bet_second, format: :json)
end
