# -*- coding: utf-8 -*-

#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Wed Feb 22 16:21:42 2017

@author: varshith

Use this code if you are saving records available in a sitemap link to the database
Requirements:
    You need an sitemap index database to be already present to save data into
    a new database of the site index
    syntax to run the code:
        python seedsavexmldata -i 'sitemap_index_database_name'
"""
from __future__ import with_statement # we'll use this later, has to be here
from BeautifulSoup import BeautifulSoup as Soup
from requests import get
from psycopg2 import connect
from datetime import date
import time
from	 selenium.common.exceptions import	 StaleElementReferenceException
from	 selenium import webdriver
from	 selenium.webdriver.remote.webelement import WebElement
 
conn = connect(database="postgres", user="postgres",
                         password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()
today = date.today()

url = 'https://www.tupaki.com/'

def parse_urls(soup,tag,dic):
    #print tag,dic,type(tag),type(dic)
    hotnews = soup.find(tag,dic)
    hotnews = str(hotnews)
    soup = Soup(hotnews)
    classifier = soup.find('h2').text.strip()
    lis=soup.findAll('a')
    for most in lis:
        newsitem_link = most.get('href')
        display_title = most.text
        print newsitem_link, display_title,  classifier
        inserttupaki(newsitem_link, display_title,  classifier)
    del lis,soup
    
    return True  
 
def	waitForLoad(driver):
    elem = driver.find_element_by_tag_name("html")
    count = 0
    while True:
        count += 1
        if count > 30:
            print("Timing	out	after 15	seconds	and	returning")
            return
        time.sleep(15)
        try:
            elem == driver.find_element_by_tag_name("html")
        except StaleElementReferenceException:
            return
        
def inserttupaki(newsitem_link, display_title,  classifier):
    query = """INSERT INTO tupaki (newsitem_link, display_title,
            classifier, url_inserted_date) values (%s,%s,%s,%s)"""
    cursor.execute(query,(newsitem_link, display_title, classifier, today))
    conn.commit()

if __name__ == '__main__':
#    driver = webdriver.PhantomJS(executable_path='/opt/phantomjs-2.1.1-linux-x86_64/bin/phantomjs')
#    driver.get(url)
#    waitForLoad(driver)
#    page = driver.page_source
#    urls = ['http://www.tupaki.com/politicalnews','http://www.tupaki.com/movienews']
#    for url in urls:
#        page = get(url)
#        if 200 != page.status_code:
#            print 'failed getting data of page ' + url
#            pass
#        soup=Soup(page.content)
#        result = parse_urls(soup,'div',{'class':'list links more'})
#        if not result:
#                 continue
    page = get(url)
    if 200 != page.status_code:
        print 'failed getting data of page ' + url
        pass
    soup=Soup(page.content)
    print soup
    print r"Content updated to the Postgres table 'tupaki'"
