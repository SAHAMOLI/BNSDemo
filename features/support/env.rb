
def open_browser

  chromedriver_path = File.join(File.absolute_path('../', File.dirname(__FILE__)),"Webdrivers","chromedriver.exe")
  geckodriver_path = File.join(File.absolute_path('../', File.dirname(__FILE__)),"Webdrivers","geckodriver.exe")
  iedriver_path= File.join(File.absolute_path('../', File.dirname(__FILE__)),"Webdrivers","IEDriverServer.exe")

  client = Selenium::WebDriver::Remote::Http::Default.new
  client.read_timeout = 600

   if ENV["BROWSER"] == nil
     Selenium::WebDriver::Chrome::Service.driver_path = chromedriver_path


     if ENV["HEADLESS"] == "ON"
       options = Selenium::WebDriver::Chrome::Options.new
       options.headless!
       $browser = Watir::Browser.new :chrome, :options => options
     else
       $browser = Watir::Browser.new :chrome, :http_client => client
     end

   elsif ENV["BROWSER"] == "firefox"

     Selenium::WebDriver::Firefox.driver_path = geckodriver_path
     $browser = Watir::Browser.new :firefox, :http_client => client
   elsif ENV["BROWSER"] == "ie"

     Selenium::WebDriver::IE.driver_path = iedriver_path
     $browser = Watir::Browser.new :ie, :http_client => client

   end

    $browser.driver.manage.window.maximize

# sets env variable for running a tests slow
# AfterStep do |step|
#   sleep 3 if ENV["SLOW"]
end

# cucumber hook that loads configuration data before a test runs
AfterConfiguration do |config|
  get_all_patterns
  get_all_elements
  get_all_configs
end

# reads save_screenshot_path from environment.json
def screenshot_path
  if $config["environments"][$environment]["save_screenshot_path"] != nil
    $save_path=$config["environments"][$environment]["save_screenshot_path"]
  else
    Dir.mkdir "./screenshots" unless Dir.exists? "./screenshots"
    $save_path="./screenshots"

    return $save_path
  end
end
