AlgoliaSearch.configuration do |config|
  config.application_id = "#{ENV['ALGOLIA_APPLICATION_ID']}",
  config.api_key = "#{ENV['ALGOLIA_ADMIN_API_KEY']}"
end
