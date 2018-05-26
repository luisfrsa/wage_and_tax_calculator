require 'fileutils'
require 'without_accents'

    
    # Custom commands
    def mouse_over(element_selector)
      element = Capybara.page.driver.browser.find_element(:css, element_selector)
      Capybara.page.driver.browser.mouse.move_to element
    end
    
    # Screenshots
    def take_screenshot(file_name, result)
      timer_path = Time.now.strftime('%Y_%m_%d').to_s
      file_path = "reports/screenshots/test_#{result}/run_#{timer_path}"
      screenshot = "#{file_path}/#{file_name},#.png".without_accents
      screenshot = screenshot.sub! ',', ''
      screenshot = screenshot.sub! '#', ''
      page.save_screenshot(screenshot)
      embed(screenshot, 'image/png', 'SCREENSHOT')
    end