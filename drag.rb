require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

driver.get "https://the-internet.herokuapp.com/"

element = driver.find_element(:link_text, "Drag and Drop").click

element = driver.find_element(:id, "column-a")

e = driver.find_element(:id, "column-b")

driver.action.drag_and_drop(element, e).perform
sleep(5)

driver.quit