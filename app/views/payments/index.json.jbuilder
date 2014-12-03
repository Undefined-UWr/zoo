json.array!(@payments) do |payment|
  json.extract! payment, :id, :animal_id, :user_id, :status
  json.url payment_url(payment, format: :json)
end
