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
import logging

logging.basicConfig(filename='ga_url_capture.log',level=logging.DEBUG)


logging.debug('trying to establish a connection with database')
conn = connect(database="insmedia", user="postgres",
                         password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()
logging.info('connection established successfully')
url = 'http://telugu.greatandhra.com/index.php'
today = date.today()

def hotnews():
    logging.debug('entered into hotnews in ga_url_capture')
    page = get(url)
    print url
    if 200 != page.status_code:
        print 'failed getting data of page ' + url
        return False
    classifier = 'hotnews'
    soup=Soup(page.content)
    hotnews = soup.find('ul',{'class':'news_style1'})
    hotnews = str(hotnews)
    soup = Soup(hotnews)
    lis=soup.findAll('a')
    for most in lis:
        newsitem_link = most.get('href')
        display_title = most.text
        print newsitem_link, display_title,  classifier
        insertga(newsitem_link, display_title,  classifier)
    del lis,soup
    logging.debug('exiting from hotnews in ga_url_capture')
    return True

def othernews(page):
    logging.info('entered othernews in ga_url_capture')
    soup=Soup(page.content)
    hotnews = soup.find('div',{'class':'content'})
    classifier = soup.find('div',{'class':'header'}).text.strip()
    hotnews = str(hotnews)
    soup = Soup(hotnews)
    lis=soup.findAll('a')
    for most in lis:
        newsitem_link = most.get('href')
        display_title = most.text
        print newsitem_link, display_title,  classifier
        insertga(newsitem_link, display_title,  classifier)
    del lis,soup
    
    logging.debug('leaving the othernews function in ga_url_capture')
    return True

def insertga(newsitem_link, display_title,  classifier):
    logging.info('entered insertga')
    paper = 'greatandhra'
    query = """INSERT INTO posts (newsitem_link, display_title,
            classifier, url_inserted_date, paper) values (%s,%s,%s,%s,%s)"""
    cursor.execute(query,(newsitem_link, display_title, classifier, today, paper))
    conn.commit()
    logging.debug('inserting the details into databases is done')

def ga():
    logging.info('this is the main function of ga_url_capture')
    result = hotnews()
    if not result:
             pass
    query = """select link from ga_menu""" #+ """ where s_no in (4)"""
    cursor.execute(query)
    urls = cursor.fetchall()
    for url in urls:
        page = get(url[0])
        print url[0]
        if 200 != page.status_code:
            print 'failed getting data of page ' + url
            continue
        result = othernews(page)
        if not result:
             continue
    print r"Content updated to the Postgres table 'posts'"

if __name__ == '__main__':
    logging.info('calling the main function ga()')
    ga()
