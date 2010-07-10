require 'test_helper'

class GroupTest < ActiveSupport::TestCase

  test "group attributes must not be empty" do
    group = Group.new
    assert group.invalid?
    assert group.errors[:name].any?
  end

  test "group name must be unique" do
    group = Group.new(:name => groups(:work).name)
    assert !group.save
    assert group.errors[:name].any?
  end
  
end
