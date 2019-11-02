require_relative '../../Infrastructure/data_reader_engine/yaml_reader'
class RemoteBrowsers


  def initialize
    @browser_version = YamlReader.get_dev_data('browser_version')
    @remote_url = YamlReader.get_dev_data('remote_url')
  end


  def run_on_browserstack(browser_name, browser_version, os_name, os_version, screen_resolution)
    remote_url = YamlReader.get_browserstack_data('remote_url')
    caps = Selenium::WebDriver::Remote::Capabilities.new
    caps['browser'] = browser_name #'Firefox'
    caps['browser_version'] = browser_version #'53.0'
    caps['os'] = os_name #'Windows'
    caps['os_version'] = os_version #'10'
    caps['resolution'] = screen_resolution # '1024x768'
    caps["browserstack.debug"] = "true"
    return load_caps_and_create_remote_driver_browserstack(caps, remote_url)
  end

  def run_on_remote_chrome(os_name)
    profile = Selenium::WebDriver::Chrome::Profile.new
    profile['intl.accept_languages'] = 'en'
    caps = Selenium::WebDriver::Remote::Capabilities.chrome
    # caps.version = @browser_version
    caps.platform = os_name
    caps['chromeOptions'] = { 'profile' => profile.as_json['zip'] }
    return load_caps_and_create_remote_driver(caps)
  end



  def run_on_remote_firefox(os_name)
    caps = Selenium::WebDriver::Remote::Capabilities.firefox
    # caps.version = @browser_version
    caps.platform = os_name
    # caps[:name] = 'Hello World!'
    return load_caps_and_create_remote_driver(caps)
  end

  def run_on_remote_iexplorer(os_name)
    caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer
    # caps.version = @browser_version
    caps.platform = os_name
    caps['enablePersistentHover'] = false
    return load_caps_and_create_remote_driver(caps)
  end

  def run_on_remote_safari(os_name)
    caps = Selenium::WebDriver::Remote::Capabilities.safari
    caps.version = @browser_version
    caps.platform = os_name
    # caps[:name] = 'Hello World!'
    return load_caps_and_create_remote_driver(caps)
  end


  def run_on_remote_edge(os_name)
    caps = Selenium::WebDriver::Remote::Capabilities.edge
    caps.platform = os_name
    # caps[:name] = 'Hello World!'
    return load_caps_and_create_remote_driver(caps)
  end


  def load_caps_and_create_remote_driver(caps)
    return @driver = Selenium::WebDriver.for(
        :remote,
        url: @remote_url,
        desired_capabilities: caps)
  end

  def load_caps_and_create_remote_driver_browserstack(caps, remote_url)
    return @driver = Selenium::WebDriver.for(
        :remote,
        url: remote_url,
        desired_capabilities: caps)
  end

end