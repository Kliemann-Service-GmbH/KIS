

* Fixtures API documentation https://api.rubyonrails.org/v5.2.3/classes/ActiveRecord/FixtureSet.html
* Minitest with fixtures https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-minitest
* Test Models in Rails 5 https://rubyplus.com/articles/3111-Model-Tests-in-Rails-5


* OLD! Nice blog post about fixtures in 2014 (dug) https://chriskottom.com/blog/2014/11/fixing-fixtures/
* OLD! Another blog post about fixtures https://blog.bigbinary.com/2014/09/21/tricks-and-tips-for-using-fixtures-in-rails.html


# Unit test
## minitest

```ruby
require 'test_helper'

class <OBJECT>Test < ActiveSupport::TestCase
  def setup
    @<object> = <objects>(:baroness)
  end

  test 'valid <object>' do
    assert @<object>.valid?
  end

  # with error messages
  test 'invalid without <attribute>' do
    @<object>.<attribute> = nil
    assert_not @<object>.valid?, 'saved <object> without a <attribute>'
    assert_not_nil @<object>.errors[:<attribute>], 'no validation error for <attribute> present'
  end

  # without error message
  test 'invalid without <attribute>' do
    @<object>.<attribute> = nil
    assert_not @<object>.valid?
    assert_not_nil @<object>.errors[:<attribute>]
  end

end
```
