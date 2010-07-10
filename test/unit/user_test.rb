require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:login].any?
    assert user.errors[:email].any?
    assert user.errors[:first_name].any?
    assert user.errors[:last_name].any?
  end

  test "user email must be a valid email" do
    user = User.new(:login => 'mylogin',
                    :first_name => 'myfirstname',
                    :last_name => 'mylastname')

    user.email = 'blabla.com'
    assert user.invalid?
    assert user.errors[:email].any?

    user.email = 'blabla@blabla'
    assert user.invalid?
    assert user.errors[:email].any?

    user.email = 'blabl/a@blabla'
    assert user.invalid?
    assert user.errors[:email].any?

    user.email = 'blab_la@blabla'
    assert user.invalid?
    assert user.errors[:email].any?

    user.email = 'blab la@blabla'
    assert user.invalid?
    assert user.errors[:email].any?

    user.email = 'blabla@bla.com'
    assert user.valid?
  end

  test "user login must be unique" do
    user = User.new(:login => users(:john).login,
                    :email => 'myemail@mail.com',
                    :first_name => 'myfirstname',
                    :last_name => 'mylastname')
    assert !user.save
    assert user.errors[:login].any?
  end

  test "user email must be unique" do
    user = User.new(:email => users(:john).email,
                    :login => 'mylogin',
                    :first_name => 'myfirstname',
                    :last_name => 'mylastname')
    assert !user.save
    assert user.errors[:email].any?
  end

end
