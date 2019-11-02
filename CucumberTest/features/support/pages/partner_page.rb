require_relative '../pages/base_page'
require_relative '../pages/partner_page'
require_relative '../pages/date_of_birth_page'
class PartnerPage < CountryPage

  RADIO_BUTTON_LOCATOR = {:id => 'label-yes'}
  RADIO_BUTTON2_LOCATOR ={:id => 'label-no'}
  RADIO_BUTTON3_LOCATOR = {:id => 'label-no'}
  RADIO_BUTTON4_LOCATOR = {:id => 'label-no'}
  NEXT_BUTTON_LOCATOR = {:id => 'next-button'}
  def initialize(driver)
    @driver = driver
  end

  def select_partner_yes_or_no
    @driver.find_element(RADIO_BUTTON_LOCATOR).click
    return self
  end

  def select_next_button
    CountryPage.new(@driver).select_next_button
    return self
  end


  def are_you_pregnant_or_given_birth
    @driver.find_element(RADIO_BUTTON4_LOCATOR).click
    return self
  end

  def do_you_or_partner_collect_benefit
    @driver.find_element(RADIO_BUTTON2_LOCATOR).click
    CountryPage.new(@driver).select_next_button
    return self
  end


  def select_next_to_progress
    @driver.find_element(NEXT_BUTTON_LOCATOR).click
    return InjuryPage.new(@driver)
  end


  def select_you_and_partner_income
    @driver.find_element(RADIO_BUTTON3_LOCATOR).click
    return self
  end

  def select_next_button3
    CountryPage.new(@driver).select_next_button
    return AssertionPage.new(@driver)
  end



end