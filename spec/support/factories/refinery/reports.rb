
FactoryGirl.define do
  factory :report, :class => Refinery::Reports::Report do
    sequence(:keyword) { |n| "refinery#{n}" }
  end
end

