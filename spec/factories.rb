# By using the symbol ':user', we get Factory Girl to simulate the User model.

Factory.define :user do |user|
  user.sequence(:name) { |n| "Admin User #{n}" }
  user.role "Admin"
  user.email "joe@sample.com"
  user.password "foobar"
  user.password_confirmation "foobar"
end

Factory.define :product do |product|
  product.sequence(:id) { |n| "#{n}" }
  product.sequence(:title) { |n| "#{n}title" }
  product.description "description"
  product.price "12"
  product.category "Rahmen"
end

Factory.define :order do |order|
  order.first_name "Eric"
  order.last_name "Nordmeyer"
  order.street "Leipziger Str. 5"
  order.zip "44139"
  order.city "Dortmund"
  order.country "Deutschland"
  order.email "eric@nordmeyer.name"
  order.pay_type "Vorkasse"
  order.accept_conditions true
  order.status "Steht aus"
end  

Factory.define :category do |category|
  category.title "Title"
  category.description "description"
end
