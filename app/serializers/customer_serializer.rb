class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone
end
