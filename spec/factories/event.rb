FactoryBot.define do
  factory :event do
    sequence(:title) { |n| "Event #{n}" }
    location { 'Zoom' }
    starttime { DateTime.new(2021, 1, 1, 9, 0) }
    endtime { DateTime.new(2021, 1, 1, 11, 0) }
    organizeremail { "test@domain.com" }
    organizertelegram { "@test_event" }

    trait :invalid do
      location { nil }
    end
  end
end
