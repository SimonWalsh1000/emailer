json.array!(@checks) do |check|
  json.extract! check, :id, :name, :string, :email
  json.url check_url(check, format: :json)
end
