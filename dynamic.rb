require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

LINK = "https://the-internet.herokuapp.com/"
DYN = "Dynamic Loading"
EX1 = "Example 1"
EX2 = "Example 2"
BTN = "button"
FIN = "#finish h4"



driver.get LINK

element = driver.find_element(:link_text, DYN).click

element = driver.find_element(:partial_link_text, EX1).click

element = driver.find_element(:tag_name, BTN).click

element = driver.find_element(:css, FIN)

wait.until { element.displayed? }

puts element.text
# sleep(10)
# element = driver.find_element(:css, "#finish h4").text

driver.navigate.back

element = driver.find_element(:partial_link_text, EX2).click

 driver.find_element(:tag_name, BTN).click 

begin
element = wait.until { driver.find_element(:css => FIN) }
end
#wait.until { element.displayed? }

puts element.text

driver.quit