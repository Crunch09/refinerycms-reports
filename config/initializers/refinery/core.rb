Refinery::Core.configure do |config|
  config.register_javascript "admin"
  config.register_stylesheet "reports", :media => 'screen'
end
