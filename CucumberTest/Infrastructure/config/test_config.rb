class TestConfig

  # ENV['CHROME_DRIVER_PATH'] =  File.join(File.expand_path('..'),'/drivers/chrome/chromedriver')
  # ENV['GECKO_DRIVER_PATH'] =  File.join(File.expand_path('..'),'/drivers/firefox/geckodriver')
  # ENV['IE_DRIVER_PATH'] =  File.join(File.expand_path('..'),'/drivers/ie/IEDriver')

  ENV['CSV_PATH'] =  File.join(File.expand_path('..'),'/testdata/')
  ENV['PROJECT_PATH'] =File.join(File.expand_path('..'),'/CucumberTest/')

  ENV['DRIVER_PATH'] = File.join(File.expand_path('..'),'CucumberTest/drivers/')
end