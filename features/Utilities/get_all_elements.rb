
# loads all page objects into a global hash
def get_all_elements
    $elements = {}
    Dir.glob("./features/support/page_objects/**/*.rb").each do |page|
      require page
      class_name = page.split("/")[-1].gsub(".rb", "")
  
      Object.const_get(class_name)::elements.each do |element, locator|
        norm = normalize_key(element)
        if $elements[norm] == nil
          $elements[norm] = locator
        else
          $elements[norm] = $elements[norm] + "|" + locator
          $elements[norm] = $elements[norm].split("|").sort.uniq.join("|")
        end
      end
    end 
  end