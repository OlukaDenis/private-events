# frozen_string_literal: true

require 'test_helper'

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  test 'should get attend_event' do
    get attendances_attend_event_url
    assert_response :success
  end

  test 'should get leave_event' do
    get attendances_leave_event_url
    assert_response :success
  end
end
