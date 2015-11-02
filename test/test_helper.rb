ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'test/unit/rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def self.startup
    DatabaseRewinder.clean_all
  end

  cleanup do
    # NOTE テストが成功した時だけ実行されるので、困るようなら teardown で DatabaseRewinder を実行すること
    DatabaseRewinder.clean
  end
end
