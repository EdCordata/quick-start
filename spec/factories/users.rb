FactoryBot.define do
  factory :user, class: User do
    email    { [ 'user', Time.current.to_i, rand(1_000..1_000) ].join('_') + '@example.com' }
    deleted  { false }
    blocked  { false }
  end
end
