require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get "https://the-internet.herokuapp.com/"

element = driver.find_element(:link_text, "File Upload").click

# element = driver.find_element(:id, "file-upload")

wait = Selenium::WebDriver::Wait.new(:timeout => 20) # seconds
begin
  element = wait.until { driver.find_element(:id, "file-upload").click }
end
element.send_keys("/users/chiragmaniar/desktop/ss.png")

puts "Uploading..."


element = driver.find_element(:id, "file-submit")
element.click
sleep(10)


puts "Page title is #{driver.title}"

driver.quit


