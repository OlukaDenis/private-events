FactoryBot.define do
    factory :user do
        username { "mcdenny" }
        email { "test@gmail.com" }
    end

    factory :event do
        title { "Title" }
        date { DateTime.now }
        description { "This is a description"}
    end
end