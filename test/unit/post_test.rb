require File.dirname(__FILE__) + '/../test_helper'

class PostTest < Test::Unit::TestCase
  should_belong_to :blog, :user
  
  should_require_attributes :title, :body
  
  context "A Post" do
    
    setup do
      @economy = Factory(:post, :title => 'Crisis', :body => 'more')
      @country = Factory(:post, :title => 'New country', :body => 'more')
      @country.published!
    end
    
    should "find one result" do
      assert_contains Post.site_search('country'), @country
      
      @stories = Post.site_search('more')
      
      assert_contains @stories, @country 
      assert_does_not_contain @stories, @economy
    end
    
    should "find only published" do
      @posts = Post.published
      assert_contains @posts, @country
      
      assert_does_not_contain @posts, @economy
      
    end
  
  end
end
