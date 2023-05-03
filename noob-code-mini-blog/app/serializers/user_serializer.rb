class CommentSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :admin, :created_at
end