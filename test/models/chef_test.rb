require "test_helper"

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: 'andrei', email: 'andre@example.com')
  end
  
  test 'chef shoud be valid' do
    assert @chef.valid?
  end
  
  test 'chefname shoud be preset' do
    @chef.chefname = ' '
    assert_not @chef.valid?
  end
  
  test 'chefname chars shoud not be too long and short' do
    @chef.chefname = 'a' * 41
    @chef.chefname = 'aa'
    assert_not @chef.valid?
  end
  
  # test 'chefname chars shoud not be too schort' do 
  #   @chef.chefname = 'aa'
  #   assert_not @chef.valid?
  # end
  
  test 'email shoud be present' do
    @chef.email = ' '
    assert_not @chef.valid?
  end
  
  test 'email shoud not be too long' do
    @chef.email = 'a' * 101 + '@example.com'
    assert_not @chef.valid?
  end
  
  test 'email shoud be unique' do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    
    assert_not dup_chef.valid?
  end
  
  test 'email shoud be valid' do
    valid_addresses = %w[user@ee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au ralu+joe@monk.cm]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} shoud be valid'
    end
  end
  
  test 'email shoud reject invalid emails' do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} shoud be invalid'
    end
  
  end
  
end