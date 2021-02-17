require 'watir'
require 'page-object'
require 'rspec'
Before do
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
