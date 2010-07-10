require 'test_helper'

class TeamTest < ActiveSupport::TestCase

  test "team attributes must not be empty" do
    team = Team.new
    assert team.invalid?
    assert team.errors[:name].any?
  end

end
