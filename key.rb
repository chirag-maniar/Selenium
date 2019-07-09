require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

LINK = "https://the-internet.herokuapp.com/"
KEY = "Key Presses"
TARGET = "target"
RES = "result"

driver.get LINK

element = driver.find_element(:link_text, KEY).click

element = driver.find_element(:id, TARGET)
a = 65.chr
i = 0
while i<=255
	element.send_keys(a.next!)
	ans = driver.find_element(:id, RES).text
	puts ans
	i += 1
end

driver.quit