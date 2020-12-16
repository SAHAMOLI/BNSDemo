
Then(/^the amount (\d+) is deposited in the selected account\.$/) do |money|

  $browser.div(:id,"firstRow").exists?
  enabled= $browser.element(:xpath, "//form/div/label/input[contains(@checked, 'checked')]").exists?
  value1= $browser.element(:xpath, "//form/div/label/input[contains(@checked, 'checked')]").attribute_value("value")
  puts "the form id is #{value1}"

  if enabled == true

    expurl="http://dbankdemo.com/account/savings-view?selectSwitch=#{value1}"
    result=verify_url(expurl)
    if result == true
      puts "URL check passed"
      # table = $browser.table(:id => "transactionTable")
      # row_count = table.rows.length
      # column_count = table.row.cells.length

      newbalance= $browser.element(:xpath, "//form[@id=#{value1}]/div/div[7]").text
      puts "new balance is #{newbalance}"
      oldbalance= $browser.element(:xpath, "//*[@id='transactionTable']/tbody/tr[2]/td[5]").text
      puts "old balance is #{oldbalance}"
      # deposit=newbalance-oldbalance
      # puts "Deposited amount is #{deposit}"
      #
      # if deposit == money
      #   puts "Test Passed"
      # else
      #   puts "Test Failed"
      # end
    end
  else
    puts "URL check failed"
  end
end


Then(/^the amount (\d+) is withdrawn from the selected account\.$/) do |money|
  $browser.div(:id,"firstRow").exists?
  enabled= $browser.element(:xpath, "//form/div/label/input[contains(@checked, 'checked')]").exists?
  value1= $browser.element(:xpath, "//form/div/label/input[contains(@checked, 'checked')]").attribute_value("value")
  puts "the form id is #{value1}"

  if enabled == true

    expurl="http://dbankdemo.com/account/savings-view?selectSwitch=#{value1}"
    result=verify_url(expurl)
    if result == true
      puts "URL check passed"
      newbalance= $browser.element(:xpath, "//form[@id=#{value1}]/div/div[7]").text
      puts "new balance is #{newbalance}"
      oldbalance= $browser.element(:xpath, "//*[@id='transactionTable']/tbody/tr[2]/td[5]").text
      puts "old balance is #{oldbalance}"
      # withdrawn=oldbalance-newbalance
      #
      # puts "Withdrawn amount is #{withdrawn}"
      #
      # if deposit == money
      #   puts "Test Passed"
      # else
      #   puts "Test Failed"
      # end
    end
  else
    puts "URL check failed"
  end

end


