# frozen_string_literal: true
require 'rspec'
require_relative '../pages/search_page'

Given(/^a user goes to Amazon home page$/) do
  @amazon_page = SearchPage.new(@browser)
  @amazon_page.visit_amazon_site
end

When(/^a user search for "([^"]*)"$/) do |keyword|
  @amazon_page.search_box_element.wait_until(&:present?)
  @amazon_page.enter_search_keyword(keyword)
  @amazon_page.click_search_button
end

Then(/^amazon should return result for "([^"]*)"$/) do |arg|
  result = expect(@amazon_page.search_results_present?(arg)).to eql(true)
  @amazon_page.close
  if result == true
    puts "TRUE"
  else
    puts "FALSE"
  end
end