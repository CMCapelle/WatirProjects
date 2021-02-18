class UniteUsResourcePage
  include PageObject

  # Declared these elements, but then called them from the browser.. had difficulty getting Watir to work here.
  # The Framework I am used to handles these in a much more elegant way.
  text_field(:search_field, id: 'searchInput')
  image(:search_img, class: 'search-text')
  article(:provider_result, class: 'list-item')
  button(:print_button, class: 'button print', value: 'print')
  span(:first_provider_span, class: 'span', index: 0)
  span(:second_provider, xpath: '/html/body/section/section/section/div/p/span')

  def visit_site
    @browser.goto 'https://nccare360.resources.uniteus.io/.'
  end

  def enter_search_keyword(search_key)
    self.search_field = search_key
  end

  def submit
    browser.image(class: 'search-text').fire_event :click
    puts 'Clicking the submit button!'
  end

  def submit_provider
    browser.h3(class: ["h3", "services-label"]).fire_event :click
    puts 'Clicking the provider card!'
  end

  def print
    browser.button(class: ["button", "print"]).fire_event :click
    puts 'Clicking the Print button!'
  end

  def close
    @browser.close
  end

  def verify
    first_provider_card = browser.span(xpath: '/html/body/section/div/div[2]/section[1]/div/article[1]/p/span').text.strip
    puts "The first value is:  #{first_provider_card}"
    second_provider_card = browser.span(xpath: '/html/body/section/section/section/div/p/span').text.strip
    puts "The 2nd value is:  #{second_provider_card}"

    if first_provider_card == second_provider_card
      puts 'They Match!'
      puts 'TEST: PASSES'
    else
      puts 'Uh oh... the values do not match :('
      puts 'TEST: FAILS'
      expect(first_provider_card.to(eql(second_provider_card)))
    end
  end
end
