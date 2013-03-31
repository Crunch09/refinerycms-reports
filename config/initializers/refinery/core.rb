Refinery::Core.configure do |config|
  config.register_javascript "reports"
  config.register_javascript "jquery_nested_form"
  config.register_javascript "jquery-fileupload/basic"
  config.register_stylesheet "reports", :media => 'screen'
end
