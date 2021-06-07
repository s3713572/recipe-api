json.extract! purchase_order, :id, :customer_name, :address, :city, :state, :country, :created_at, :updated_at

json.items do
  json.array! purchase_order.purchase_order_items do |order_item|
    json.food_name order_item.food.name
    json.count order_item.count
    json.unit order_item.unit
  end
end
