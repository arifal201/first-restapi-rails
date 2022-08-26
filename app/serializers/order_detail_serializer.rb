class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :qty, :price , :product_id, :product_name

  def product_name
    object.try(:product).name
  end
end
