current_users = User.all.count
10.times { User.create(Fabricate.attributes_for(:user)) }
created_users = User.all.count - current_users
p "#{created_users} users created with these names: #{User.last(10).map(&:username)}"
p "Total users in the database = #{User.count}"
