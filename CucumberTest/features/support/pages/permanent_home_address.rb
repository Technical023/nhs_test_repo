require_relative '../../support/pages/base_page'
RADIO_BUTTON2_LOCATOR ={:id => 'label-no'}

class PermanentHomeAddress < CountryPage
  def initialize(driver)
    @driver = driver
  end

  def live_at_home_or_care_home
    @driver.find_element(RADIO_BUTTON2_LOCATOR).click
    return self
  end

  def select_next_button
    CountryPage.new(@driver).select_next_button
    return PartnerPage.new(@driver)
  end



end