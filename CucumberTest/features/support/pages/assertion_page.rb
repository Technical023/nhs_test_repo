require_relative '../../support/pages/base_page'
#HELP_ASSERTION_TEXT = {:id => 'lis-button'}
HELP_ASSERTION_TEXT = {:id => 'prescription-tick'}
class AssertionPage


  def initialize(driver)
    @driver = driver
  end

  def assert_help_type(help_or_not)
  return @driver.page_source.downcase.include?(help_or_not.downcase)
  end


  # def assert_help_type(prescription)
  #   return @driver.find_element(HELP_ASSERTION_TEXT).text.include?(prescription)
  # end

end