json.array!(@orders) do |order|
  json.extract! order, :id, :name, :address, :text, :email, :pay_type
  json.url order_url(order, format: :json)
end
