module Refinery
  module Reports
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Reports

      engine_name :refinery_reports

      initializer "register refinerycms_departments plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "departments"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.reports_admin_departments_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/reports/department',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/reports/departments(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Departments)
      end
    end
  end
end
