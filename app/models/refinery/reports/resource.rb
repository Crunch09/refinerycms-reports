module Refinery
  module Reports
    class Resource < Refinery::Core::BaseModel

      belongs_to :usable, polymorphic: true
      belongs_to :report
    end
  end
end
