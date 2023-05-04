class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :admin, :created_at
end