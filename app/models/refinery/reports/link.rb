module Refinery
  module Reports
    class Link < Refinery::Core::BaseModel

      belongs_to :report

      attr_accessible :title, :url

      validates :url, presence: true

    end
  end
end
