require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

LINK = "https://the-internet.herokuapp.com/"
UPLOAD = "File Upload"
FILEUP = "file-upload"
FILE = "/users/chiragmaniar/desktop/ss.png"
SUBMIT = "file-submit"

driver.get LINK

element = driver.find_element(:link_text, UPLOAD).click

# element = driver.find_element(:id, "file-upload")

wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
begin
  element = wait.until { driver.find_element(:id, FILEUP) }
end
element.send_keys(FILE)

puts "Uploading..."


element = driver.find_element(:id, SUBMIT)
element.click
sleep(5)


puts "Page title is #{driver.title}"

driver.quit


