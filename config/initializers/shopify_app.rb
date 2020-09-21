ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = ENV['2369f3f83a919af9f2d623b9259ec461']
  config.secret = ENV['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']
  config.old_secret = ""
  config.scope = "read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2020-07"
  config.shop_session_repository = 'Shop'
  config.allow_jwt_authentication = true
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
