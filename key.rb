require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get "https://the-internet.herokuapp.com/"

element = driver.find_element(:link_text, "Key Presses").click

element = driver.find_element(:id, "target")
a = 65.chr
i = 0
while i<=255
	element.send_keys(a.next!)
	ans = driver.find_element(:id, "result").text
	puts ans
	i += 1
end

driver.quit