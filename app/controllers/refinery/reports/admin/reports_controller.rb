module Refinery
  module Reports
    module Admin
      class ReportsController < ::Refinery::AdminController

        crudify :'refinery/reports/report',
                :title_attribute => 'keyword', :xhr_paging => true


        def create
          @report = Report.new(params[:report])
          if @report.save
            redirect_to refinery.reports_admin_reports_path, notice: 'Report was created'
          else
            render action: 'new'
          end
        end


        def update
          @report = Report.find(params[:id])
          if @report.update_attributes(params[:report])
            redirect_to refinery.reports_admin_reports_path, notice: 'Report was updated!'
          else
            render action: 'edit'
          end
        end
      end
    end
  end
end
