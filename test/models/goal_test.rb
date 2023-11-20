require "test_helper"

class GoalTest < ActiveSupport::TestCase
    test "goal attributes must not be empty" do
        goal = Goal.new
        assert goal.invalid?
        assert goal.errors[:title].any?
        assert goal.errors[:description].any?
        assert goal.errors[:due_date].any?
    end
end