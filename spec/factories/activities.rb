FactoryBot.define do
  factory :activity do
    project { nil }
    activity_type { "MyString" }
    content { "MyText" }
    status_change { "MyString" }
    user { nil }
  end
end
