require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: 'bob', email: 'bob@example.com')
    @recipe = @chef.recipes.build(name: 'Chicken', summary: 'This is the best chick parm recipe ever', description: 'heat all, add all remove all ,add salt and peper')
  end
  
  test 'recipe shoud be valid' do
    assert @recipe.valid?
  end
  
  test 'name shoud be present' do
    @recipe.name = ' '
    assert_not @recipe.valid?
  end
  
  test 'chef_id shoud be present' do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test 'name length shoud not be too long' do
    @recipe.name = 'a' * 101
    assert_not @recipe.valid?
  end
  
  test 'name length shoud not be too short' do
    @recipe.name = 'aaaa'
    assert_not @recipe.valid?
  end
  
  test 'summary shoud be present' do
    @recipe.summary = ' '
    assert_not @recipe.valid?
  end
  
  test 'summary length shoud not be too long' do 
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test 'summary length shoud not be too short' do
     @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test 'description must be present' do
    @recipe.description = ' '
    assert_not @recipe.valid?
  end
  
  test 'description length shoud not be too long' do 
      @recipe.description = 'a' * 501
      assert_not @recipe.valid?
  end
  
  test 'description length shoud not be too short' do
      @recipe.description = 'a' * 19
      assert_not @recipe.valid?
  end
  
end