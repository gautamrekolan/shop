# By using the symbol ':user', we get Factory Girl to simulate the User model.

Factory.define :user do |user|
  user.name "Admin User"
  user.role "Admin"
  user.password "foobar"
  user.password_confirmation "foobar"
end

Factory.define :product do |product|
  product.title "title"
  product.description "description"
  product.price "12"
  product.category "Rahmen"
end