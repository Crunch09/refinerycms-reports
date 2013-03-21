module Refinery
  module Reports
    class Department < Refinery::Core::BaseModel

      has_many :persons
      has_many :vehicles

      accepts_nested_attributes_for :persons, allow_destroy: true
      accepts_nested_attributes_for :vehicles, allow_destroy: true

      attr_accessible :name, :position, :intern, :persons_attributes,
                      :vehicles_attributes

      acts_as_indexed :fields => [:name]

      validates :name, presence: true, uniqueness: true
    end
  end
end
