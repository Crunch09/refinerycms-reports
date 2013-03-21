module Refinery
  module Reports
    class Vehicle < Refinery::Core::BaseModel

      belongs_to :department
      has_many :resources, as: :usable

      attr_accessible :name, :short_name, :department_id

      acts_as_indexed :fields => [:name]

      validates :name, presence: true


      def self.grouped
        all.group_by{|x| x.department.name}
      end
    end
  end
end
