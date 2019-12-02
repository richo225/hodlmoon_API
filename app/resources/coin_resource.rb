class CoinResource < JSONAPI::Resource
  include Rails.application.routes.url_helpers

  caching
  attributes :name, :symbol, :cmc_rank, :icon_url

  def icon_url
    url_for(@model.icon)
  end

  def self.default_sort
    [{ field: 'cmc_rank', direction: :asc }]
  end
end
