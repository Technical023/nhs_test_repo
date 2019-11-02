require_relative '../pages/base_page'


class DateOfBirthPage < CountryPage
  DAY_LOCATOR = {:id => 'dob-day'}
  MONTH_LOCATOR = {:id => 'dob-month'}
  YEAR_LOCATOR = {:id => 'dob-year'}
  NEXT_BUTTON_LOCATOR = {:id => 'next-button'}


  def initialize(driver)
    @driver = driver
  end


  def enter_dob(day, month, year)
    @driver.find_element(DAY_LOCATOR).send_keys(day)
    @driver.find_element(MONTH_LOCATOR).send_keys(month)
    @driver.find_element(YEAR_LOCATOR).send_keys(year)
    return self
  end

def select_next_to_continue
  @driver.find_element(NEXT_BUTTON_LOCATOR).click
  return PartnerPage.new(@driver)

end




end