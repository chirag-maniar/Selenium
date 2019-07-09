require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
LINK = "https://the-internet.herokuapp.com/"
BTN = 'button'
JS = "JavaScript Alerts"
ALERT = 'Click for JS Alert'
CONFIRM = 'Click for JS Confirm'
PROMPT = 'Click for JS Prompt'

driver.get LINK

element = driver.find_element(:link_text, JS).click

buttons =  driver.find_elements(:tag_name=> BTN)

clickMeButton = buttons.select{|el| el.text == ALERT}.first

clickMeButton.click

begin
  driver.switch_to.alert.accept
  puts "ok"
rescue Selenium::WebDriver::Error::NoAlertOpenError
  retry
end

clickMeButton = buttons.select{|el| el.text == CONFIRM}.first

clickMeButton.click

begin
  driver.switch_to.alert.accept
  puts "ok"
rescue Selenium::WebDriver::Error::NoAlertOpenError
  retry
end

clickMeButton = buttons.select{|el| el.text == PROMPT}.first

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