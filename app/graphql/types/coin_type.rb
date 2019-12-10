module Types
  class CoinType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :symbol, String, null: false
    field :cmc_rank, Integer, null: false
    field :icon_url, Types::Url, null: false

    def icon_url
      Rails.application.routes.url_helpers.url_for(object.icon)
    end
  end
end
