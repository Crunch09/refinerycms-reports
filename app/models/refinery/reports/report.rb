require_relative '../../../../lib/models/type.rb'

module Refinery
  module Reports
    class Report < Refinery::Core::BaseModel
      self.table_name = 'refinery_reports'

      has_many :images
      has_many :resources
      has_many :links

      accepts_nested_attributes_for :images, allow_destroy: true
      accepts_nested_attributes_for :links, allow_destroy: true

      attr_accessible :keyword, :location,
                      :started_at, :ended_at, :is_running, :chief,
                      :report, :author, :position, :coordinates,
                      :images_attributes, :vehicle_ids, :person_ids,
                      :links_attributes, :typ


      acts_as_indexed :fields => [:keyword, :location, :chief, :report, :author]

      validates :keyword, presence: true
      validates :location, presence: true
      validates :started_at, presence: true
      validates :chief, presence: true

      def vehicle_ids
        resources.select{|r| r.usable.is_a?(Vehicle) }.map(&:id)
      end

      def vehicle_ids=(vehicle_ids)
        (self.vehicle_ids - vehicle_ids).each do |del|
          Resource.find(del).destroy
        end
        vehicle_ids.delete_if{|x| x.empty? }.each do |v|
          unless self.vehicle_ids.include?(v)
            x = Resource.new
            x.usable = Vehicle.find(v)
            x.report = self
            self.resources << x
          end
        end
      end

      def person_ids=(person_ids)
        (self.person_ids - person_ids).each do |del|
          Resource.find(del).destroy
        end
        person_ids.delete_if{|x| x.empty? }.each do |v|
          unless self.person_ids.include?(v)
            x = Resource.new
            x.usable = Person.find(v)
            x.report = self
            self.resources << x
          end
        end
      end

      def person_ids
        resources.select{|r| r.usable.is_a?(Person)}.map(&:id)
      end
    end
  end
end
