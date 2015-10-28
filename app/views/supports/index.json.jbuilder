json.array!(@supports) do |support|
  json.extract! support, :id, :title, :body
  json.url support_url(support, format: :json)
end
