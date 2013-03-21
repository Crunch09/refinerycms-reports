require_relative '../../../uploaders/PhotoUploader'

module Refinery
  module Reports
    class Image < Refinery::Core::BaseModel

      belongs_to :report

      attr_accessible :photo, :report_id, :photo_cache

      mount_uploader :photo, PhotoUploader
    end
  end
end
