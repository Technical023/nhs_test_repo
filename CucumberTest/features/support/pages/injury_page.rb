require_relative '../pages/base_page'
require_relative '../../support/pages/country_page'
INJURY_BUTTON_LOCATOR = {:id => 'label-no'}

class InjuryPage < CountryPage

  def initialize(driver)
    @driver = driver
  end

  def select_injury_next_button
    CountryPage.new(@driver).select_next_button
    return PermanentHomeAddress.new(@driver)
  end

  def had_diabetes?
    PartnerPage.new(@driver).select_partner_yes_or_no
    PartnerPage.new(@driver).select_next_button
    return self
  end

  def had_glaucoma?
    PartnerPage.new(@driver).select_partner_yes_or_no
    PartnerPage.new(@driver).select_next_button
    return PermanentHomeAddress.new(@driver)
  end

  def had_injury_before_?
    @driver.find_element(INJURY_BUTTON_LOCATOR).click
    return self
  end

  def select_next
    CountryPage.new(@driver).select_next_button
    return PermanentHomeAddress.new(@driver)
  end





end