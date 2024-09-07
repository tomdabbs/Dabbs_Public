
from selenium import webdriver
import lxml

url='https://mvendor.cgieva.com/Vendor/public/AllOpportunities.jsp'

driver = webdriver.PhantomJS()


##driver=webdriver.Chrome()
driver.get(url)
innerHTML = driver.execute_script("return document.body.innerHTML")
##print(driver.page_source)
print(innerHTML)

'''import bs4
import re
from time import sleep

sleep(1)
root=bs4.BeautifulSoup(innerHTML,"lxml")
viewcount=root.find_all("span",attrs={'class':'short-view-count style-scope yt-view-count-renderer'})


for span in viewcount:
print(span.string)

driver.quit()'''