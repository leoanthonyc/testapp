require "test_helper"

class ChargesControllerTest < ActionDispatch::IntegrationTest
  test "should display three lists" do
    get root_url
    assert_select 'h1', /Failed Charges/
    assert_select 'h1', /Disputed Charges/
    assert_select 'h1', /Successful Charges/
  end

  test "should display 10 items in successful list" do
    get root_url
    andrew = customers(:andrew)
    mike = customers(:mike)
    johnny = customers(:johnny)
    raj = customers(:raj)
    andrew_or_mike_or_johnny_or_raj = [andrew.full_name, mike.full_name, johnny.full_name, raj.full_name].join("|")
    assert_select 'ul.successful-charges li:nth-child(10)', /#{andrew_or_mike_or_johnny_or_raj}/
    assert_select 'ul.successful-charges li:nth-child(11)', false, 'This page must only display 10 successful charges'
  end

  test "should display 5 items in failed list" do
    get root_url
    andrew = customers(:andrew)
    mike = customers(:mike)
    andrew_or_mike = [andrew.full_name, mike.full_name].join("|")
    assert_select 'ul.failed-charges li:nth-child(5)', /#{andrew_or_mike}/
    assert_select 'ul.failed-charges li:nth-child(6)', false, 'This page must only display 5 failed charges'
  end

  test "should display 5 items in disputed list" do
    get root_url
    johnny = customers(:johnny)
    raj = customers(:raj)
    johnny_or_raj = [johnny.full_name, raj.full_name].join("|")
    assert_select 'ul.disputed-charges li:nth-child(5)', /#{johnny_or_raj}/
    assert_select 'ul.disputed-charges li:nth-child(6)', false, 'This page must only display 5 disputed charges'
  end
end
