## Why 

one more project to display how to use sinatra with mongoid sinatra factorygirl rake bootstrap coffeescript resque resque-schuduler and deploy to heroku or cf

## HOW

prepare the singin user and default team
```ruby
  rake seeds:prepare
```

```ruby
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
```

## Where
Heroku:<br/>
http://sinatra-db.herokuapp.com<br/>
User: admin<br/>
Password: password<br/>

### heroku related

```ruby
#added mongo support 
heroku addons:add mongohq:sandbox

# login in console
heroku run bundle exec racksh

#created the seeds for login
heroku run bundle exec rake seeds:prepare
```

## addtion

rack-webconsole 