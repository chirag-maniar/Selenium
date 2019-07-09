require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

LINK = "https://the-internet.herokuapp.com/"
DRAG = "Drag and Drop"
COLA = "column-a"
COLB = "column-b"

driver.get LINK

element = driver.find_element(:link_text, DRAG).click

element = driver.find_element(:id, COLA)

e = driver.find_element(:id, COLB)

driver.action.drag_and_drop(element, e).perform
sleep(5)

driver.quit