module Refinery
  module Reports
    module Admin
      class DepartmentsController < ::Refinery::AdminController

        crudify :'refinery/reports/department',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
