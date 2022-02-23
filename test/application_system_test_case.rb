require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  TEST_BROWSER = ENV['TEST_BROWSER'].presence&.to_sym || (ENV['CODESPACES'] ? :headless_firefox : :headless_chrome)
  driven_by :selenium, using: TEST_BROWSER, screen_size: [1400, 1400]
end
