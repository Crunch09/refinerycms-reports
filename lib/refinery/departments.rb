require 'refinerycms-core'
require 'nested_form'

module Refinery
  autoload :ReportsGenerator, 'generators/refinery/reports_generator'

  module Departments
    require 'refinery/departments/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
