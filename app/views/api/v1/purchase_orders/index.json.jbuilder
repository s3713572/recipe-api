json.data do
  json.purchase_orders do
    json.array! @purchase_orders, partial: "api/v1/purchase_orders/purchase_order", as: :purchase_order
  end
end