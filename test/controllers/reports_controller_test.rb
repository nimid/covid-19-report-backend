require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test 'should update report, if report has expired' do
    ReportService.stubs(:expired?).returns(true)
    ReportService.expects(:update).once

    get '/', as: :json

    assert_response :success
  end

  test 'should not update report, if report is up to date' do
    ReportService.stubs(:expired?).returns(false)
    ReportService.expects(:update).never

    get '/', as: :json

    assert_response :success
  end
end
