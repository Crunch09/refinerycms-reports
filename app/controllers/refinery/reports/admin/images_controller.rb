module Refinery
  module Reports
    module Admin
      class ImagesController < ::Refinery::AdminController

        def index
          @images = Image.where(report_id: params[:report_id])
          @report_id = params[:report_id]
          @image = Image.new(report_id: params[:report_id])
        end

        def create
          @image = Image.new(params[:image])
          @image.report_id = params[:report_id]
          @image.save
        end

        def destroy
          @image = Image.find params[:id]
          @image.destroy
          render nothing: true
        end
      end
    end
  end
end
