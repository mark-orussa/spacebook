require 'test_helper'

class GalaxyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should_add_notification" do
    assert (get :add_notification, id: 4, notification_id: 1)
  end
end
