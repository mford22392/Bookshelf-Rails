class BookGenreSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :book_id, :genre_id
end
