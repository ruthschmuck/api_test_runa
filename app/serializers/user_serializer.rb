class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :lastName, :docId, :address, :phone
end
