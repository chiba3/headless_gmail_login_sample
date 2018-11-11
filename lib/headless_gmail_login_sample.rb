require "headless_gmail_login_sample/version"
require "rubygems"
require "selenium-webdriver"
require 'dotenv'

module HeadlessGmailLoginSample
  def self.run()
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--lang=ja')
    options.add_argument('window-size=1920x1080')
    driver = Selenium::WebDriver.for :chrome, options: options

    driver.navigate.to 'https://www.google.com/intl/ja/gmail/about/#'
    driver.find_element(:css, 'body > nav > div > a.gmail-nav__nav-link.gmail-nav__nav-link__sign-in').click
    Dotenv.load "#{__dir__}/../.env"
    element = driver.find_element(:id, "Email")
    element.send_keys("#{ENV["GMAIL_USER_NAME"]}")
    element.send_keys(:enter)
    element = driver.find_element(:id, "Passwd")
    element.send_keys("#{ENV["GMAIL_USER_PASS"]}")
    element.send_keys(:enter)
    driver.save_screenshot './after_login.png'
  end
end

HeadlessGmailLoginSample.run
