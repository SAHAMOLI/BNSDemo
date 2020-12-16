# loads all pattern objects into a global hash

def get_all_patterns
    $patterns = {}
    Dir.glob("./features/support/control_repository/**/*.rb").each do |pattern|
      require pattern
      class_name = pattern.split("/")[-1].gsub(".rb", "")
  
      Object.const_get(class_name)::patterns.each do |element_type, template|
         norm = normalize_key(element_type)
  
        if $patterns[norm] == nil
          $patterns[norm] = template.join("|")
        else
          $patterns[norm] = $patterns[norm] + "|" + template.join("|")
          $patterns[norm] = $patterns[norm].split("|").sort.uniq.join("|")
        end
      end
    end 
  end