require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get "https://the-internet.herokuapp.com/"

element = driver.find_element(:link_text, "JavaScript Alerts").click

buttons =  driver.find_elements(:tag_name=> 'button')

clickMeButton = buttons.select{|el| el.text == 'Click for JS Alert'}.first

clickMeButton.click

begin
  driver.switch_to.alert.accept
  puts "ok"
rescue Selenium::WebDriver::Error::NoAlertOpenError
  retry
end

clickMeButton = buttons.select{|el| el.text == 'Click for JS Confirm'}.first

clickMeButton.click

begin
  driver.switch_to.alert.accept
  puts "ok"
rescue Selenium::WebDriver::Error::NoAlertOpenError
  retry
end

clickMeButton = buttons.select{|el| el.text == 'Click for JS Prompt'}.first

clickMeButton.click

# clickMeButton.send_keys("Chirag")
# puts "Chirag"

begin
  a = driver.switch_to.alert
  a.send_keys("chirag")
  a.accept
  puts "ok"
rescue Selenium::WebDriver::Error::NoAlertOpenError
  retry
end

sleep(5)
driver.quit