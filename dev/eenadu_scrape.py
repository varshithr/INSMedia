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
requests.packages.urllib3.disable_warnings()
import logging

logging.basicConfig(filename='eenadu_scrape.log',level=logging.DEBUG)


logging.info('trying to establish connection with database')
conn = connect(database="insmedia", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()
logging.debug('connection estabished successfully')


def scrape():
    #Change url_inserted_date every week here
    logging.info('entered into scrape function in eenadu_scrape')
    query1 = """select s_no, newsitem_link from posts where
            paper = 'eenadu' and
            url_inserted_date = current_date""" #+ """ and s_no = 2"""
    cursor.execute(query1)
    items = cursor.fetchall()
    for item in items:
        s_no = item[0]
        url = item[1]
        print url
        logging.debug(url)
        #url = url.split('..')
        if url.startswith('/'):
            url = 'http://www.eenadu.net' + url
        else:
            url = 'http://www.eenadu.net/' + url
        print s_no, url
        logging.debug(str(s_no),url)
        page = get(url)
        if 200 != page.status_code:
            print 'failed getting site url data ' + url
            continue
        soup = Soup(page.content)
        contents = soup.findAll('font', color="#000000")
        l = ''
        for content in contents:
            content = content.text
            #print content
            l = l + content
        print l, len(l)
        logging.debug(l)
        l = l.encode('utf-8')
        updatequery = "update posts set article_content = %s where s_no = %s"
        cursor.execute(updatequery,(l, str(s_no)))
        conn.commit()
    logging.debug('leaving scrape function.')
    return True

def eenadu_scrape():
    logging.info('this is main function of in eenadu_scrape')
    result = scrape()
    if not result:
         print 'There was an error!'
    else:
         print (r"scrape job for the site www.eenadu.net has been done")

if __name__ == '__main__':
    logging.info('calling eenadu_scrape main function')
    eenadu_scrape()
