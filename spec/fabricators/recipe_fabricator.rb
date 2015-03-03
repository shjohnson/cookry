recipes = [
  'goats cheese tart',
  'fish pie',
  'fish and chips',
  'strawberries and cream',
  'plum tart',
  'steak and ale pie',
  'chicken and rice',
  'pealla with fish',
  'steak with peas',
  'prawns in pasta']

Fabricator(:recipe) do
  id { SecureRandom.uuid }
  user
  name { recipes.sample }
  rating { [1, 2, 3, 4, 5].sample }
  user_id { |attrs| attrs[:user].id }
end
