FactoryBot.define do
  factory :user do
    email { 'user@test.com' }
    password { 'p@ssworD' }
    id { 1 }
  end
end
