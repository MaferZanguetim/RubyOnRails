class CategorySerializer < ActiveModel::Serializer
    attributes :id, :name, :created_at

    has_many :posts, serializer: PostSerializer, if: -> { instance_options[:list_posts] }
end