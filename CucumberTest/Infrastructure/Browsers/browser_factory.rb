require_relative 'local_browsers'
require_relative '../../Infrastructure/data_reader_engine/yaml_reader'
require_relative 'remote_browsers'

class BrowserFactory

  attr_accessor :driver

  def initialise_browser(browser_name, os_name, place_of_execution)
    if(place_of_execution.downcase.include?('local'))
      set_desired_local_environment(browser_name, os_name)
    elsif(place_of_execution.downcase.include?('remote'))
      set_desired_remote_environment(browser_name, os_name)
    elsif(place_of_execution.downcase.include?('browserstack'))
      set_desired_browserstack_environment
    else
      raise('There is no such env.')
    end
    return prepare_browser
  end



  def prepare_browser
    #@driver.manage.window.maximize
    default_time = YamlReader.get_dev_data('default_time')
    @driver.manage.timeouts.implicit_wait = default_time
    @driver.manage.delete_all_cookies
    return @driver
  end



  def set_desired_browserstack_environment()
    browser_name = YamlReader.get_browserstack_data('browser_name')
    browser_version = YamlReader.get_browserstack_data('browser_version')
    os_name = YamlReader.get_browserstack_data('os_name')
    os_version = YamlReader.get_browserstack_data('os_version')
    screen_resolution = YamlReader.get_browserstack_data('screen_resolution')

    remoteBrowser = RemoteBrowsers.new()
    remoteBrowser.run_on_browserstack(browser_name, browser_version, os_name, os_version, screen_resolution)
  end

  def set_desired_remote_environment(browserName, os_name)
    remoteBrowser = RemoteBrowsers.new()
    if(browserName.downcase.include?('chrome'))
      @driver = remoteBrowser.run_on_remote_chrome(os_name)
    elsif(browserName.downcase.include?('firefox'))
      @driver = remoteBrowser.run_on_remote_firefox(os_name)
    elsif(browserName.downcase.include?('iexplorer'))
      @driver = remoteBrowser.run_on_remote_iexplorer(os_name)
    elsif(browserName.downcase.include?('edge'))
      @driver = remoteBrowser.run_on_remote_edge(os_name)
    end

  end

  def set_desired_local_environment(browserName, machine_name)
    if(browserName.downcase.include?('chrome'))
      @driver = LocalBrowsers.new().open_chrome_driver(machine_name)
    elsif(browserName.downcase.include?('firefox'))
      @driver = LocalBrowsers.new().open_firefox_driver(machine_name)
    elsif(browserName.downcase.include?('iexplorer'))
      @driver = LocalBrowsers.new().open_ie_driver
    elsif(browserName.downcase.include?('phantom'))
      @driver = LocalBrowsers.new().open_phantomjs_driver(machine_name)
    end
  end




  def close_browser
    if(@driver != nil)
      @driver.quit
      @driver==nil
    end
  end


end