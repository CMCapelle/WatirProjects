# frozen_string_literal: true
require 'rspec'
require_relative '../pages/unite_us_resource_page'

Given(/^a user navigates to UniteUS resource page$/) do
  @uniteus_page = UniteUsResourcePage.new(@browser)
  @uniteus_page.visit_site
end

When(/^a user searches for "([^"]*)"$/) do |keyword|
  @uniteus_page.enter_search_keyword(keyword)
  @uniteus_page.submit
end

And(/^a user clicks first provider card$/) do
  @uniteus_page.submit_provider
end

And(/^a user clicks the print button$/) do
  @uniteus_page.print
end

Then(/^Verify that an opened drawer with detailed information about the same provider you clicked on is displayed$/) do
  @uniteus_page.verify
end