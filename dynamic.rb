require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

driver.get "https://the-internet.herokuapp.com/"

element = driver.find_element(:link_text, "Dynamic Loading").click

element = driver.find_element(:partial_link_text, "Example 1").click

element = driver.find_element(:tag_name, "button").click

element = driver.find_element(:css, "#finish h4")

wait.until { element.displayed? }

puts element.text
# sleep(10)
# element = driver.find_element(:css, "#finish h4").text

driver.navigate.back

element = driver.find_element(:partial_link_text, "Example 2").click

 driver.find_element(:tag_name, "button").click 

begin
element = wait.until { driver.find_element(:css => "#finish h4") }
end
#wait.until { element.displayed? }

puts element.text

driver.quit