FactoryBot.define do
  pass = Faker::Internet.password(6)
  name = Faker::Internet.email
  email = Faker::Internet.email
  c = Payment.create_customer(email, name)
  
  factory :owner do
    name                  {name}
    email                 {email}
    password              {pass}
    password_confirmation {pass}
    confirmed_at          {Time.now}
    pay_customer_id       {c.id}
  end
end