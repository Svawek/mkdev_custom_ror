FactoryBot.define do
  factory :event do
    sequence(:title) { |n| "Event #{n}" }
    location { 'Zoom' }
    starttime { DateTime.new(2021, 01, 01, 9, 00) }
    endtime { DateTime.new(2021, 01, 01, 11, 00) }
    organizeremail { "test@domain.com" }
    organizertelegram { "@test_event" }

    trait :invalid do
      location { nil }
    end
  end
end