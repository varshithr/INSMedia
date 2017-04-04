#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Wed Mar  1 16:39:43 2017

@author: venkatesh
"""
from BeautifulSoup import BeautifulSoup as Soup
from psycopg2 import connect
from requests import get
import requests.packages.urllib3
import logging
requests.packages.urllib3.disable_warnings()
import os
from concurrent.futures import ProcessPoolExecutor

path=os.path.abspath(os.path.join(os.getcwd(), os.pardir))+'/logs'

logging.basicConfig(filename=path+'/'+'ga_scrape.log',level=logging.DEBUG)

logging.info('connecting to database from ga_scrape')
conn = connect(database="insmedia", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()
logging.info('connected successfully')

def feeditems(item):
    s_no = item[0]
    url = item[1]
    print s_no, url
    page = get(url)
    if 200 != page.status_code:
        print 'failed getting site url data ' + url
        pass
    soup = Soup(page.content)
    try:
        logging.debug('trying to scrape the pictures')
        img_url = soup.find('div', {'class':'todays_picture'})
        img = str(img_url)
        img = soup.find('img')
        img_url = img.get('src')
        print img_url
    except AttributeError:
        logging.error('got an AttributeError in ga_scrape')
        pass
    try:
        logging.debug('scraping the content')
        contents = soup.find('div', {'class':'content'}).text
    except AttributeError:
        logging.error('got AttributeError in ga_scrape while scraping the content')
        continue

    left = contents.find('Go to www')
    contents = contents[:left]
    print contents
    updatequery = """update posts set (article_content,
    image_link) = (%s,%s) where s_no = %s"""
    cursor.execute(updatequery,( contents, img_url, str(s_no)))
    conn.commit()

def scrape():
    #Change url_inserted_date every week here
    logging.info('entered into scrape function')
    query1 = """select s_no, newsitem_link from posts where
            paper = 'greatandhra' and
            url_inserted_date = current_date""" #+ """ and s_no = 2"""
    cursor.execute(query1)
    items = cursor.fetchall()
    e=ProcessPoolExecutor()
    e.map(feeditems, items)
    logging.debug('leaving scrape function.')
    return True

def ga_scrape():
    logging.info('this is the main function in ga_scrape')
    result = scrape()
    if not result:
         print 'There was an error!'
    else:

        logging.info("scrape job for the site www.greatandhra.com has been done")
        print (r"scrape job for the site www.greatandhra.com has been done")

if __name__ == '__main__':
    logging.debug('calling the main function')
    ga_scrape()
