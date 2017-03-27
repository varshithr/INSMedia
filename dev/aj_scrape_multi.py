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
import time

requests.packages.urllib3.disable_warnings()

path=os.path.abspath(os.path.join(os.getcwd(), os.pardir))+'/logs'

logging.basicConfig(filename=path+'/'+'aj_scrape.log',level=logging.DEBUG)

logging.info('trying to estabish connection with database')
conn = connect(database="insmedia", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()
logging.debug('connection estabished successfully')

def scraper(item):
        s_no = item[0]
        url = item[1]
        url = 'http://www.andhrajyothy.com/' + url
        print s_no, url
        page = get(url)
        if 200 != page.status_code:
            print 'failed getting site url data ' + url
            return
        soup = Soup(page.content)
        try:
            display_title = soup.find('span', {'id':'ContentPlaceHolder1_lblStoryHeadLine'}).text
            display_title = display_title.encode('utf-8')
        except AttributeError:
            logging.error('some AttributeError got in scraping function')
            pass
        print display_title
        try:
            img_url = soup.find('img', {'id':'ContentPlaceHolder1_ImgStoty'})
            img_url = img_url.get('src')
            print img_url
        except AttributeError:
            logging.error('some AttributeError got in scraping function')
            pass
        try:
            contents = soup.find('span', {'id':'ContentPlaceHolder1_lblStoryDetails'}).text
            shift = contents.find(':')
            contents = contents[shift + 1:]
            contents = contents.encode('utf-8')
        except AttributeError:
            logging.error('some AttributeError got in scraping function')
            pass
#            print 'special case'
#            contents = soup.find('div', {'id':'pastingspan1'}).text
#            contents = contents.encode('utf-8')
        print contents
        updatequery = """update posts set (display_title, article_content,
        image_link) = (%s,%s, %s) where s_no = """ + str(s_no)
        cursor.execute(updatequery,(display_title, contents, img_url))
        conn.commit()

def scrape():
    logging.info('entered scrape function')
    #Change url_inserted_date every week here
    query1 = """select s_no, newsitem_link from posts where 
            paper = 'andhra jyothi' and
            url_inserted_date = current_date""" + """ and s_no = 11789"""
    cursor.execute(query1)
    items = cursor.fetchall()
    e = ProcessPoolExecutor()
    e.map(scraper, items)
    logging.info('leaving scraping function')
    return True

def aj_scrape():
    logging.info('entered into aj_scrape function')
    result = scrape()
    if not result:
         print 'There was an error!'
    else:
         print (r"scrape job for the site www.andhrajyothy.com has been done")

if __name__ == '__main__':
    start = time.clock()
    logging.info('aj_scrape main function')
    aj_scrape()
    print time.clock() - start