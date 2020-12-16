class Patterns

  class << self
    attr_accessor :patterns
  end

  @patterns =
      {
          "dropdown" => [

              "//div/label/strong[contains(text(), '<replace>')]",
              "//div/select[@name='id']/../label/strong[text()='<replace>']",
              "//div/label/strong[text()='<replace>']//following::select"
          ],

          "textfield" => [
              "//div/input[contains(@id, '<replace>')]",
          # "//div/label/strong[contains(text(), '<replace>')]",
    
          ],

          "button" => [
              "//button[contains(@id,'<replace>')]",
              "//li/a[contains(@id,'<replace>')]",
              "//div/button[1][contains(text(), '<replace>')]",
              "//*[@id='<replace>']",
              "//li/a[contains(text(), '<replace>')]",
              "//div/ul/li/a[text()= '<replace>']",
          ],
          "accordion" => [
              "//ul/li/a/span[contains(text(), '<replace>')]",
          ],

          "radio" => [
              "//div/label/strong[contains(text(), '<replace>')]/../../../div/label/input[contains(@id,'<replace2>')]",

          ],
          # "upload" => [
          #     "//td[contains (text(), '<replace>')]/../td[2]//input[@type= 'file']",
          #     "//div/input[@type= 'file']",
          #     "//div/button[contains (text(), '<replace>')]/../div/input"
          # ],
          #
          # "checkbox" => [
          #     "//a[contains(text(), 'Favorites')]/../../..//span[contains(text(), '<replace>')]/ancestor::tr//div[@class= 'checkbox-custom']",
          #     "//span[text()='<replace>']/ancestor::tr//div[@class='checkbox-custom']//label",
          #     "//strong[contains(text(), '<replace>')]/../../../td/div/label",
          #     "//label[contains(text(), '<replace>')]"
          # ],

          # "tab" => [
          #     "//a[text()='<replace>']"
          # ],

          # "upload" => [
          #     "//td[contains (text(), '<replace>')]/../td[2]//input[@type= 'file']",
          #     "//div/input[@type= 'file']",
          #     "//div/button[contains (text(), '<replace>')]/../div/input"
          # ],
          # "date" => [
          #     "//select/option[contains(text(), '<replace>')]/../option[2]"
          # ],
          # "link" => [
          #     "//span[contains(text(),'<replace>')]",
          #     "//li/a[contains(text(),'<replace>')]",
          #     "//span/a[contains(text(),'<replace>')]",
          #     "//a/span[contains(text(), '<replace')]",
          #     "//div/span[contains(text(),'<replace>')]"
          # ],
         "message" => [
          "//div/div/div[contains(text(), '<replace>')]"
          ]
      }
end
