require_relative '../../Infrastructure/config/test_config'

class LocalBrowsers


  def open_chrome_driver(machine_type)
    if(machine_type.downcase.include?('linux'))
      linux_chrome_path = ENV['DRIVER_PATH']+'linux/chrome/chromedriver'
      @driver = Selenium::WebDriver.for(:chrome, driver_path: linux_chrome_path)
    elsif(machine_type.downcase.include?('windows'))
      windows_chrome_path = ENV['DRIVER_PATH']+'windows/chrome/chromedriver.exe'
      @driver = Selenium::WebDriver.for(:chrome, driver_path: windows_chrome_path)
    end
    return @driver
  end

  def open_firefox_driver(machine_type)
    if(machine_type.downcase.include?('linux'))
      linux_gecko_path = ENV['DRIVER_PATH']+'linux/firefox/geckodriver'
      @driver = Selenium::WebDriver.for(:firefox, marionette:true, driver_path: linux_gecko_path)
    elsif(machine_type.downcase.include?('windows'))
      windows_gecko_path = ENV['DRIVER_PATH']+'windows/firefox/geckodriver.exe'
      @driver = Selenium::WebDriver.for(:firefox, marionette:true, driver_path: windows_gecko_path)
    end
    return @driver
  end

  def open_phantomjs_driver(machine_type)
    if(machine_type.downcase.include?('linux'))
      linux_phantom_path = ENV['DRIVER_PATH']+'linux/phantom/phantomjs-2.1.1-linux-x86_64/bin/phantomjs'
      @driver = Selenium::WebDriver.for(:phantomjs, driver_path: linux_phantom_path)
    elsif(machine_type.downcase.include?('windows'))
      window_phantom_path = ENV['DRIVER_PATH']+'windows/phantom/phantomjs-2.1.1-windows/bin/phantomjs.exe'
      @driver = Selenium::WebDriver.for(:phantomjs, driver_path: window_phantom_path)
    end
    return @driver
  end

  def  open_ie_driver
    ie_path = ENV['DRIVER_PATH']+'windows/iexplorer/IEDriverServer.exe'
     return @driver = Selenium::WebDriver.for(:ie, driver_path: ie_path)
  end

end