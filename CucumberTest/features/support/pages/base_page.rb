require_relative '../../../Infrastructure/data_reader_engine/yaml_reader'

class BasePage

  attr_accessor :driver

  def initialize(driver)
    @driver = driver
  end

  def visit_home_page
    url = YamlReader.get_dev_data('base_url')
    driver.navigate.to(url)
    return CountryPage.new(@driver)

  end

end
