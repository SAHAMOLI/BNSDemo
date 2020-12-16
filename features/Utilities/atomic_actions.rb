# Each method in this file uses watir to interact with elements in the browser
# these are common actions and uses find_locator method to locate an xpath to use for the action

def click(element, type=nil, element2=nil)
	if type == "searchbutton"
	 type = "button"
	end
	if type == "link"
		type = "button"
	end
	if type == "tab"
		type = "button"
	end
	if type == "menu"
		type = "button"
	end
	locator = find_locator(element, type, element2)
	$browser.element(:xpath => locator).wait_until(&:present?)
	# $browser.element(:xpath => locator).scroll_into_view
	$browser.element(:xpath => locator).click
end


def radio(answer, element, type=nil)
	locator = find_locator(element, "radio", answer) 
	$browser.element(:xpath => locator).wait_until(&:present?)
	# $browser.element(:xpath => locator).scroll_into_view
	$browser.element(:xpath => locator).click
end

def enter_text(element, text, element2 = nil) 
	locator = find_locator(element, "textfield", element2)
	$browser.element(:xpath => locator).wait_until(&:present?)
	$browser.element(:xpath => locator).scroll_into_view
	$browser.text_field(:xpath => locator).click
	$browser.text_field(:xpath => locator).clear
	$browser.text_field(:xpath => locator).send_keys(text)
end

def enter_text_popup(element, text) 
	locator = find_locator(element, "popup")
	$browser.element(:xpath => locator).wait_until(&:present?)
	$browser.element(:xpath => locator).scroll_into_view
	$browser.text_field(:xpath => locator).set(text)
end

def select_option(option, element, element2=nil)

	locator = find_locator(element, "dropdown",element2)
	$browser.windows.last.use
	$browser.element(:xpath => locator).exists?
	$browser.element(:xpath => locator).wait_until(&:present?)
	$browser.select_list(:xpath => locator).click
	$browser.option(:value, option).click

end

def upload(element, text, element2 = nil, fname) 
	locator = find_locator(element, "upload", element2)
	$browser.element(:xpath => locator).wait_until(&:present?)
	path = File.expand_path(File.dirname(text))
	path = path + fname
	$browser.text_field(:xpath => locator).send_keys(path)
	sleep(0.5)
end

#Clear the textfield and enter new value 
def update_text(element, text, element2 = nil) 
	locator = find_locator(element, "textfield", element2)
	$browser.element(:xpath => locator).wait_until_present
	$browser.element(:xpath => locator).scroll_into_view
	$browser.text_field(:xpath => locator).click
	$browser.text_field(:xpath => locator).clear
	sleep(2)
	$browser.text_field(:xpath => locator).send_keys(text)
	sleep(0.5)
end


#Append the URL w.r.t the environment
# def append_url
# 	if ENV["ENVIRONMENT"] == "test"
# 		$append= "https://ttes"
# 	  elsif ENV["ENVIRONMENT"] == "dev"
# 		$append= "https://dtes"
# 	  else 
# 		$append ="https://ttes"
# 	  end
# 	  return $append
# 	end
	



