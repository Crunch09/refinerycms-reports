module Refinery
  module Reports
    module Admin
      class PersonsController < ::Refinery::AdminController

        crudify :'refinery/reports/person',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
