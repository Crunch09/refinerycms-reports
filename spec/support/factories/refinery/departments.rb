
FactoryGirl.define do
  factory :department, :class => Refinery::Reports::Department do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

