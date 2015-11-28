class BookSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title, :author_id, :description
end
