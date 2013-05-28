FactoryGirl.define do
  factory :team do
    name 'King'
  end

  sample_login = ['jack', 'lucy', 'dave', 'lily', 'john', 'beth'].sample
  sequence(:name) { |n| "#{sample_login}#{n}" }
  sequence(:username) { |n| "#{sample_login}#{n}" }
  sequence(:email) { |n| "#{sample_login}#{n}@example.com".downcase }

  factory :user do
    name
    email
    username
    password Digest::MD5.hexdigest('password')
    team
    trait :admin do
      name "Admin Admin"
      username 'admin'
      email 'admin@admin.com'
      leadOf {team}
    end
  end


end
