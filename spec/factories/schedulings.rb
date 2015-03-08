FactoryGirl.define do
  factory :scheduling do
    sequence(:id) { |n| n }
    room_id 1
    user_id 1
    time "2015-03-07 22:06:42"
  end
end
