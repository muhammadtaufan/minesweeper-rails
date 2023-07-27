FactoryBot.define do
  factory :board do
    name { 'Test' }
    email { 'test@a.com' }
    width { 5 }
    height { 5 }
    mines { 3 }
  end
end
