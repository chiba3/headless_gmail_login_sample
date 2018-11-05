require "headless_gmail_login_sample/version"
require "rubygems"
require "selenium-webdriver"

module HeadlessGmailLoginSample
  def self.run()
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    driver = Selenium::WebDriver.for :chrome, options: options

    driver.navigate.to 'https://www.google.co.jp/'
    driver.save_screenshot './google.png'
  end
end

HeadlessGmailLoginSample.run
