Then (/^the Savings Account is opened successfully$/)do

  $browser.div(:id,"firstRow").exists?
  enabled= $browser.element(:xpath, "//form/div/label/input[contains(@checked, 'checked')]").exists?
  value1= $browser.element(:xpath, "//form/div/label/input[contains(@checked, 'checked')]").attribute_value("value")
  puts "the form id is #{value1}"

  if enabled == true

    expurl="http://dbankdemo.com/account/savings-view?selectSwitch=#{value1}"
    result=verify_url(expurl)
    if result == true
      puts "Test Passed"
    end
  else
    puts "Test Failed"
  end

end
