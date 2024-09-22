FactoryBot.define do
  factory :board do
    sequence(:title, "title_1")
    sequence(:opinion, "opinion_1")
    sequence(:background, "background_1")
    sequence(:emotion, "emotion_1")
    sequence(:value, "value_1")
    association :user
  end
end
