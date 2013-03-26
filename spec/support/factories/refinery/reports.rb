
FactoryGirl.define do
  factory :report, :class => Refinery::Reports::Report do
    sequence(:keyword) { |n| "refinery#{n}" }
    location 'Boston'
    started_at '2013-03-23 10:00:00'
    chief 'Peter Parker'
  end
end

