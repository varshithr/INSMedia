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
import os
from concurrent.futures import ProcessPoolExecutor

path=os.path.abspath(os.path.join(os.getcwd(), os.pardir))+'/logs'

logging.basicConfig(filename = path+'/'+ 'oneindia_scrape.log',level=logging.DEBUG)

logging.debug('trying to establish a database connection')
conn = connect(database="insmedia", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()
logging.info('connection established successfully')
today = date.today()


def insertoi(newsitem_link, display_title, image_link):
    logging.info('entered into insertoi to insert the details into db')
    paper = 'oneindia'
    query = """INSERT INTO posts (newsitem_link, display_title,
            image_link, url_inserted_date, paper) values (%s,%s,%s,%s,%s)"""
    cursor.execute(query,(newsitem_link, display_title, image_link, today, paper))
    conn.commit()
    logging.debug('successfully inserted into db')

def scraper(item):
    s_no = item[0]
    url = item[1]
    print s_no, url
    page = get(url)
    if 200 != page.status_code:
        print 'failed getting site url data ' + url
        return
    soup = Soup(page.content)
    contents = soup.find('div', {'class':'ecom-ad-content'}).text
    contents = contents.encode('utf-8')
    print contents
    classifier = soup.find('div', {'class':'breadcrump clearfix'})
    classifier = classifier.get('data-category')
    classifier = classifier.encode('utf-8')
    print classifier
    conn = connect(database="insmedia", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
    cursor = conn.cursor()
    updatequery = """update posts set (article_content, 
    classifier) = (%s,%s) where s_no = %s"""
    cursor.execute(updatequery,(contents, classifier, str(s_no)))
    conn.commit()

def scrape():
    logging.info('entered into scrape in oneindia_url_capture')
    #Change url_inserted_date every week here
    query1 = """select s_no, newsitem_link from posts 
    where url_inserted_date = current_date and
    paper = 'oneindia'""" #+ """ and where s_no = 764"""
    cursor.execute(query1)
    items = cursor.fetchall()
    e = ProcessPoolExecutor()
    e.map(scraper, items)    
    logging.debug('leaving the function scrape')
    return True

def oneindia_scrape():
    logging.info('entered into oneindia_scrape function')
    result = scrape()
    if not result:
         print 'There was an error!'
    else:
         print (r"scrape job for the site http://telugu.oneindia.com has been done")
    logging.info('leaving the oneindia_scrape function')

def oneindia():
    logging.info('entered into oneindia function')
    resp = get('http://telugu.oneindia.com/sitemap-latest.xml')
	# we didn't get a valid response, bail
    if 200 != resp.status_code:
		return False
    soup = Soup(resp.content)
    urls = soup.findAll('url')
    urls.pop(0)
    for u in urls:
        newsitem_link = u.find('loc').string
        lastmod = u.find('lastmod').string
        df_lastmod = date(int(lastmod[:4]),int(lastmod[5:7]),int(lastmod[8:10]))
        try:    
            image_link = u.find('image:loc').string
        except AttributeError:
            image_link = ''
        try:
            display_title = u.find('image:title').string
        except AttributeError:
            display_title = ''                                  
        print newsitem_link, image_link, display_title
        insertoi(newsitem_link, display_title,  image_link)
        if df_lastmod != today :
            break
    print r"Content updated to the Postgres table 'posts'"
    logging.debug("Content updated to the Postgres table 'posts'")

if __name__ == '__main__':
    logging.info('calling oneindia function and oneindia_scrape function')
    oneindia()
    oneindia_scrape()