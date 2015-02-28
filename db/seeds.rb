current_users = User.all.count
current_recipes = Recipe.all.count

## <--------Users without any recipes---------->

2.times { User.create(Fabricate.attributes_for(:user)) }

## <--------Recipes with a user---------->

3.times { Recipe.create(Fabricate.attributes_for(:recipe)) }

## <--------User with 5 recipes---------->
user = User.create(Fabricate.attributes_for(:user))
5.times { Recipe.create(Fabricate.attributes_for(:recipe, user: user)) }



created_recipes = Recipe.all.count - current_recipes
created_users = User.all.count - current_users

p "#{created_users} users created with these usernames: #{User.last(10).map(&:username)}"
p "Total users in the database = #{User.count}"
p "#{created_recipes} recipes created"
p "This user has 5 recipes :#{user.username}"
