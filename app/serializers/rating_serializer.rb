class RatingSerializer < ActiveModel::Serializer
  attributes :id, :estimation
  has_one :post
end
