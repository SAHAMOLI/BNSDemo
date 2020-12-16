# This is a list of gems that will need to be installed to run the tests.
require "watir"
require "cucumber"
require 'rubygems'
require "time"

gemlist = ["savon", "nokogiri", "colorize", "ffi"]
# this spins up a session to install the gems if they are not already installed
gemlist.each do |this_gem|
  begin
    gem this_gem
  rescue Gem::LoadError
    puts "\e[1;33mInstalling new ruby gem: #{this_gem}\e[0m"
    sleep 2
    system("set http_proxy=http://wsaproxy.bcbsar.net:8080")
    system("set https_proxy=http://wsaproxy.bcbsar.net:8080")
    puts "after proxy set"
    system("gem install #{this_gem}")
    puts "gem install happening"
    system("set http_proxy=")
    system("set http_proxy=")
  end
  require this_gem
end

if ENV["ENVIRONMENT"] != nil
  $environment = ENV["ENVIRONMENT"]
else
  $environment = "test"
end

# global variable for warm_up method
$warmup = 0

# Cucumber before hook, all actions are done before the feature is executed
Before('@feature') do
  unless $setup_is_done
    open_browser
    login
    $setup_is_done = true
  end
end


# Cucumber after hook, all actions are done after the last succesfull step of a scenario is executed.
After do |scenario|

  if ENV["TEST"] == "ALL"
    if scenario.passed?
      screenshot = "./PASSED#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{Time.now.strftime("%Y%m%d-%H%M%S")}.png"
      $browser.screenshot.save screenshot_path + screenshot
    end

    if scenario.failed?
      screenshot = "./FAILED#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{Time.now.strftime("%Y%m%d-%H%M%S")}.png"
      $browser.screenshot.save screenshot_path + screenshot
    end

  elsif ENV["TEST"] == "PASS"
      if scenario.passed?
        screenshot = "./PASSED#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{Time.now.strftime("%Y%m%d-%H%M%S")}.png"
        $browser.screenshot.save screenshot_path + screenshot
      end
  elsif ENV["TEST"] == "FAIL"
      if scenario.failed?
        screenshot = "./FAILED#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}_#{Time.now.strftime("%Y%m%d-%H%M%S")}.png"
        $browser.screenshot.save screenshot_path + screenshot
      end
  end
end


# loads up a file and turns the data into a hash of arrays to be used by enrollment and renew_enrollment nethods
# def get_hash
#   $objects = {}
#   Dir.glob("./features/support/tes_objects/**/*.rb").each do |widjet|
#     require widjet
#     class_name = widjet.split("/")[-1].gsub(".rb", "")
#
#     Object.const_get(class_name)::elements.each do |object_type, template|
#       norm = normalize_key(object_type)
#
#       if $objects[norm] == nil
#         $objects[norm] = template.join("|")
#       else
#         $objects[norm] = $objects[norm] + "|" + template.join("|")
#         $objects[norm] = $objects[norm].split("|").sort.uniq.join("|")
#       end
#     end
#   end
#  end

# Produces a random First name
def first_name
  size = $first_names.size
  size = size - 1
  fname = $first_names[rand(0..size)]
  return fname
end

# Produces a random last name
def last_name
  size = $last_names.size
  size = size - 1
  lname = $last_names[rand(0..size)]
  return lname
end

# Produces a random birthday for employee's
# def random_date_between
#   require "date"
#   from = "01/01/1960"
#   till = "01/01/2000"
#   from = Date.parse(from) unless from.is_a? Date
#   till = Date.parse(till) unless till.is_a? Date
#   date = from + rand(till - from)
#   fdate = date.strftime("%m/%d/%Y")
#   return fdate
# end

def random_gender
  gender = ["Male", "Female"]
  random = gender.shuffle
  return random.first
end


def address
  size = $address.size
  size = size - 1
  address = $address[rand(0..size)]
  return address
end

def date_select(element)
  locator = find_locator(element, "date")
  $browser.windows.last.use
  $browser.element(:xpath => locator).wait_until_present
  $browser.element(:xpath => locator).click
end

# Specifies the url and login credentials for new employer enrollment
# def employer_enrollment
#   $url = $config["environments"][$environment]["employer"]
#   $browser.goto($url)
#   step "I click on the Sign In button"
#   $browser.text_field(:xpath => "//div[contains(@class, 'active')]//label[contains(text(), 'Username')]/following-sibling::input").send_keys("executive")
#   $browser.text_field(:xpath => "//div[contains(@class, 'active')]//label[contains(text(), 'Password')]/following-sibling::input").send_keys("Password1!")
#   $browser.element(:xpath => "//div[contains(@class, 'active')]//button[contains(text(), 'Sign In')]").click
# end

# def warm_up
#   if $warmup != 1
#     employer = $config["environments"][$environment]["test"]
#     blueprint = $config["environments"][$environment]["blueprint"]
#     warm_up_action(employer)
#     warm_up_action(blueprint)
#     $warmup = 1
#   end
# end

# def warm_up_action(url)
#   $browser.goto(url)
#   begin
#     $browser.element(:xpath => "//body").wait_until_present
#   rescue
#     $browser.send_keys([:f5])
#     sleep 2
#   end
# end

# Specifies the url and login credentials for new employer enrollment
# def renew_employer_enrollment
#   $url = $config["environments"][$environment]["employer"]
#   $browser.goto($url)
#   step "I click on the Sign In button"
#   $browser.text_field(:xpath => "//div[contains(@class, 'active')]//label[contains(text(), 'Username')]/following-sibling::input").send_keys("president2")
#   $browser.text_field(:xpath => "//div[contains(@class, 'active')]//label[contains(text(), 'Password')]/following-sibling::input").send_keys("Password1!")
#   $browser.element(:xpath => "//div[contains(@class, 'active')]//button[contains(text(), 'Sign In')]").click
# end

def get_warning
  $patterns.each do |key, value|
    # puts "#{key} value is #{value}"
    #just to look into what value it fetches
    if value.length > 3
      warn "#{key} has more than 3 ways to find an element".yellow
    end
  end
end
