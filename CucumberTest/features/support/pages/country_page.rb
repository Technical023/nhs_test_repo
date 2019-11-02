require_relative '../pages/base_page'

class CountryPage

  START_BUTTON_LOCATOR = {:id => 'next-button'}
  COUNTRY_LOCATOR = {:id => 'label-wales'}
  NEXT_BUTTON_LOCATOR ={:id => 'next-button'}

  def initialize(driver)
    @driver = driver
  end

  def select_start_button
    @driver.find_element(START_BUTTON_LOCATOR).click
    self
  end

  def select_your_country
    @driver.find_element(COUNTRY_LOCATOR).click
    self
  end

  def select_next_button
    @driver.find_element(NEXT_BUTTON_LOCATOR).click
    return DateOfBirthPage.new(@driver)
  end

end