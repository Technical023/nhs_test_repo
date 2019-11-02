require_relative '../../../Infrastructure/data_reader_engine/yaml_reader'

module WorldHelper



  def start_scenario
    browser = YamlReader.get_dev_data('browser_name')
    operating_system = YamlReader.get_dev_data('os_type')
    place_of_execution = YamlReader.get_dev_data('remote_or_local')
    @browser_factory = BrowserFactory.new
    @driver = @browser_factory.initialise_browser(browser, operating_system, place_of_execution)
    @basePage = BasePage.new(@driver)
  end


  def stop_scenario
    @browser_factory.close_browser
  end


end