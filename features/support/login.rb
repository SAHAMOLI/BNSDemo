require "watir"
require "cucumber"
require 'rubygems'
require "time"

def login
    $url = $config["environments"][$environment]["staging"]
    $browser.goto($url)
    enter_text("username",  "BNS_HARMAN_EXT_DEV")
    enter_text("password", "BNS_HARMAN_EXT_DEV")
    click("SIGN IN", "button")
end


