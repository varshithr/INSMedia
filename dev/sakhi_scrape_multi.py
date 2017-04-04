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
import os
from concurrent.futures import ProcessPoolExecutor

path=os.path.abspath(os.path.join(os.getcwd(), os.pardir))+'/logs'


requests.packages.urllib3.disable_warnings()
logging.basicConfig(filename=path+'/'+'sakshi_scrape.log',level=logging.DEBUG)

logging.info('establishing a database connection')
conn = connect(database="insmedia", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()
logging.debug('connection established successfully')

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
        logging.debug('scraping display_title')
        display_title = soup.find('h2').text
        display_title = display_title.encode('utf-8')
    except AttributeError:
        logging.error('got an AttributeError in scraping ')
        print 'in exc'
        pass
    print display_title
    try:
        logging.debug('trying to scrape img')
        img_url = soup.find('img', {'class':'imgbrd_left lazy'})
        img_url = img_url.get('src')
        print img_url
    except AttributeError:
        logging.error('got an AttributeError in sakshi_scrape')
        pass
    try:
        logging.info('trying to scrape text')
        contents = soup.find('p', {'style':'text-align: justify;'}).text
    except AttributeError:
        logging.error('got an AttributeError')
        contents = soup.find('div', {'class':'storydet'}).text

    left = contents.find(':')
    right = contents.find('AddThis')
    contents = contents[left + 1:right]
    contents = contents.encode('utf-8')
    print contents
    updatequery = """update posts set (display_title, article_content,
    image_link) = (%s,%s, %s) where s_no = %s"""
    cursor.execute(updatequery,(display_title, contents, img_url, str(s_no)))
    conn.commit()

def scrape():
    logging.info('entered into scrape function in sakshi_scrape')
    #Change url_inserted_date every week here
    query1 = """select s_no, newsitem_link from posts
    where url_inserted_date = current_date and
    paper = 'sakshi'""" #+ """ and s_no = 3178"""
    cursor.execute(query1)
    items = cursor.fetchall()
    e=ProcessPoolExecutor()
    e.map(feeditems,items)
    logging.debug('leaving scrape function ')
    return True

def sakshi_scrape():
    logging.info('this is sakshi_scrape main function')
    result = scrape()
    if not result:
         print 'There was an error!'
    else:
         print (r"scrape job for the site www.sakshi.com has been done")

if __name__ == '__main__':
    logging.info('calling the main function in sakshi_scrape')
    sakshi_scrape()
