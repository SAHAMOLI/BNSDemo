def verify_text(element, expected_text)
  locator = find_locator(element)
  $browser.element(:xpath => locator).scroll_into_view
  actual_text = $browser.element(:xpath => locator).wait_until(&:present?)
  fail "Failed comparison for the #{element} element:\n\tExpected: #{expected_text}\n\tActual:   #{actual_text}"
end

#Verify the actual url with the expected url
def verify_url(expURL)
  puts $browser.url
  if($browser.url.eql?(expURL))
    result=true
  end
  puts result
  return result
end

def verify_pagetitle(exptitle)
  puts $browser.title
  if($browser.title.eql?(exptitle))
    result=true
  end
  puts result
  return result
end


#Verify the textfield is enabled or disabled . If textfield is disabled returns as False otherwise True.
def verify_disabled_text(element)
  locator = find_locator(element, "textfield")
  $browser.element(:xpath => locator).wait_until_present
  $browser.element(:xpath => locator).scroll_into_view
  result=$browser.text_field(:xpath => locator).enabled?
  puts result

end

def verify_message(element, expected_text)
  result=false
  locator = find_locator(element, "message")
  # $browser.element(:xpath => locator).scroll_into_view
  actual_text = $browser.element(:xpath => locator).wait_until_present.text
  if (actual_text.eql?(expected_text))
    result=true
  end
  return result
end