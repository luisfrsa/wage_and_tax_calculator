require 'capybara'
require 'capybara/cucumber'
require "selenium-webdriver"

require_relative 'helper.rb'
require_relative 'spec_helper.rb'

BROWSER = ENV['BROWSER']
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']



Capybara.register_driver :chrome_headless do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: {
        args: %w[ no-sandbox headless disable-gpu window-size=1280,1024]
      }
    )
  
    Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
  end

  Capybara.register_driver :chrome do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: {
        args: %w[ no-sandbox disable-gpu window-size=1280,1024]
      }
    )
  
    Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
  end

  Capybara.register_driver :firefox do |app|
    options = {
        :js_errors => true,
            :timeout => 360,
                :debug => false,
                    :inspector => false,
            }
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
    end

  

## Cucumber Definitions
Before do |feature|
    ## configure the chosen browser
    Capybara.configure do |capybara|
      #Define o browser utilizado no teste
        if BROWSER.eql?('chrome')
            capybara.default_driver = :chrome
        elsif BROWSER.eql?('chrome_headless')
            capybara.default_driver = :chrome_headless
        else BROWSER.eql?('chrome_headless')
            capybara.default_driver = :firefox
        end

        #define o ambiente a ser testado
        if ENVIRONMENT_TYPE.eql?('qa')
        capybara.app_host = 'http://localhost:8081'
        else ENVIRONMENT_TYPE.eql?('dev')
          capybara.app_host = 'http://localhost:8081'
        end
      end
  
    ## set default max wait
    Capybara.default_max_wait_time = 30
  end


  After do |scenario|
    ## take screenshot
    scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
    if scenario.passed?
      take_screenshot(scenario_name, 'passed')
    else
      take_screenshot(scenario_name, 'failed')
    end
    ## kills instance when not headless
      Capybara.current_session.driver.quit
  end