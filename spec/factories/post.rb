FactoryGirl.define do
  factory :post do
    title "Post Title"
    body "Post bodies must be long enough"
    user
    topic {Topic.create(name: 'Topic name')}
  end
end
