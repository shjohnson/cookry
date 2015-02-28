Fabricator(:user) do
  id { SecureRandom.uuid }
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  username { |attrs| "#{attrs[:first_name]}#{%w(. _ -).sample}#{attrs[:last_name]}" }
  email { |attrs| "#{attrs[:first_name]}.#{attrs[:last_name]}@example.com" }
  password { Faker::Internet.password(8) }
  password_confirmation { |attrs| attrs[:password] }
end
