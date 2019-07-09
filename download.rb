require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 5)
#element = driver.find_element(:name, "q").click
DOWNLOAD = "File Download"
FILE = "test.txt"
LINK = "https://the-internet.herokuapp.com/"

driver.get LINK

element = driver.find_element(:link_text, DOWNLOAD).click

element =  driver.find_element(:link_text, FILE) 
element.click 
sleep(4)

if File.file?("/Users/chiragmaniar/Downloads/test.txt")
	puts "Downloaded"
else puts "File not found"
end

driver.quit