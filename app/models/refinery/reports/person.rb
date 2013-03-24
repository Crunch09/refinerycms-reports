module Refinery
  module Reports
    class Person < Refinery::Core::BaseModel

      belongs_to :department
      has_many :resources, as: :usable

      attr_accessible :name, :position, :info, :department_id

      acts_as_indexed :fields => [:name]

      validates :name, presence: true, uniqueness: true
      validates :position, presence: true

      def self.grouped
        all.group_by{|x| x.department.name}
      end

      def to_s
        "#{position} #{name} #{info.present? ? "(#{info})" : ""}"
      end

      def checkbox_title
        "person_ids #{id}"
      end

      def checkbox_name
        "report[person_ids][]"
      end
    end
  end
end
