require 'test_helper'

class ReportServiceTest < ActiveSupport::TestCase
  after do
    DDC::Client.unstub(:today)
  end

  describe '.exists_by?' do
    it 'returns true, if report exists by condition' do
      assert_equal true, ReportService.exists_by?(updated_date: '2021-01-23 18:07:50')
    end

    it 'returns false, if report does not exist by condition' do
      assert_equal false, ReportService.exists_by?(updated_date: '')
    end
  end

  describe '.expired?' do
    it 'returns true, if system has no report' do
      Report.destroy_all
      DDC::Client.stubs(:today).never

      assert_equal true, ReportService.expired?
    end

    it 'returns true, if last report has expired' do
      DDC::Client.stubs(:today)
                 .returns(DDC::Responses::Today.new(update_date: '2021-01-24 12:00:00')).once

      assert_equal true, ReportService.expired?
    end

    it 'returns false, if last report has not expired' do
      DDC::Client.stubs(:today)
                 .returns(DDC::Responses::Today.new(update_date: '2021-01-22 12:00:00')).once

      assert_equal false, ReportService.expired?
    end

    it 'returns false, when timeout' do
      DDC::Client.stubs(:today)
                 .raises(DDC::Errors::TimeoutError).once

      assert_equal false, ReportService.expired?
    end
  end

  describe '.update' do
    it 'returns true, if a report does not exist by update date' do
      DDC::Client.stubs(:today)
                 .returns(DDC::Responses::Today.new(update_date: '2021-01-24 12:00:00'))

      assert_equal true, ReportService.update
    end

    it 'returns true, if a report already exists by update date' do
      DDC::Client.stubs(:today)
                 .returns(DDC::Responses::Today.new(update_date: '2021-01-23 18:07:50'))

      assert_equal true, ReportService.update
    end
  end
end
