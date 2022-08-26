class OrderSerializer < ActiveModel::Serializer
  attributes :id, :date, :total, :status, :customer, :order_details

  def customer
    customer = object.try(:customer)
    
    return unless customer.present?

    CustomerSerializer.new(customer)
  end

  def order_details
    order_details = object.try(:order_details)

    return unless order_details.present?

    order_details.map {|order| OrderDetailSerializer.new(order, root:false)}
  end
end