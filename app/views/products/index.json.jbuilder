json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :style, :description, :product_image_id
  json.url product_url(product, format: :json)
end
