module Types
  class NewsType < Types::BaseObject
    field :id, ID, null: false
    field :guid, String, null: false
    field :published_on, Integer, null: false
    field :imageurl, Types::Url, null: false
    field :title, String, null: false
    field :url, Types::Url, null: false
    field :source, String, null: false
    field :body, String, null: false
    field :tags, String, null: false
    field :categories, String, null: false
    field :upvotes, Integer, null: false
    field :downvotes, Integer, null: false
  end
end
