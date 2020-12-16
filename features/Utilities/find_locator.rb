
# replaces parts of stored patterns that will create a unique xpath depending on the text passed in

def find_locator(element=nil, type=nil, element2=nil)
    locator = $patterns[type].gsub("<replace>", element)
    if element2 != nil
      locator = locator.gsub("<replace2>", element2)
    end

    return locator
end