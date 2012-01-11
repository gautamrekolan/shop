Fabricator(:user) do
  name { "Faker::Name.name "}
  role { "Admin" }
  password { "foobar" }
  password_confirmation { "foobar" }
end