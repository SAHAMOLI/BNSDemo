
Given(/^the user is on the Home Page$/) do

end

When (/^the user clicks on the (.*) Menu$/) do |element|
  
  click(element, "menu")

end

And (/^the user clicks on the (.*) link$/) do |element|
  
  click(element, "button")

end

And(/^the user clicks on ([^"]*) in the (.*) radio button$/) do|answer, element|
  
  radio(answer,element)

end

And(/^the user enters ([^"]*) into the (.*) textfield$/) do |string,element|
  
  enter_text(element,string)

end

And(/^the user clicks on the (.*) button$/) do |element|

  click(element, "button")

end

And(/^the user selects ([^"]*) in the (.*) dropdown$/) do|option, element|

  select_option(option, element)

end

