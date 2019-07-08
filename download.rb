require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 5)
#element = driver.find_element(:name, "q").click

driver.get "https://the-internet.herokuapp.com/"

element = driver.find_element(:link_text, "File Download").click

element =  driver.find_element(:link_text, "test.txt") 
element.click 
sleep(4)

if File.file?("/Users/chiragmaniar/Downloads/test.txt")
	puts "Downloaded"
else puts "File not found"
end

driver.quit