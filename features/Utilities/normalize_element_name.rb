# standardizes names and keys inside a global hash

def normalize_element_name(element)
	return element.gsub(" ", "").gsub("_", "").gsub("'", "").downcase
end
def normalize_key(element) 
	return nil if element == nil
	return element.gsub(" ", "").gsub("_", "").gsub("'", "").downcase
end