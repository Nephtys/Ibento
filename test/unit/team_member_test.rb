require 'test_helper'

class TeamMemberTest < ActiveSupport::TestCase

  test "team_member attributes must not be empty" do
    team_member = TeamMember.new
    assert team_member.invalid?
    assert team_member.errors[:auth_level].any?
  end

end
