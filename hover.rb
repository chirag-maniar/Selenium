require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
LINK = "https://the-internet.herokuapp.com/"
HOVER = "Hovers"
FIG = 'figure'

driver.get LINK


driver.find_element(:link_text, HOVER).click
wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds

begin
elements = driver.find_elements(:class, 'figure')
end

elements.each { |e| 
driver.action.move_to(e).perform
puts e.text

}

sleep(4)
driver.quit