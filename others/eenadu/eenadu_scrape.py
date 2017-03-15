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

conn = connect(database="postgres", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()


def scrape():
    #Change url_inserted_date every week here
    query1 = """select s_no, newsitem_link from eenadu where s_no > 130"""
    cursor.execute(query1)
    items = cursor.fetchall()
    for item in items:
        s_no = item[0]
        url = item[1]
        print url
        if url.startswith('/'):
            url = 'http://www.eenadu.net' + url
        else:
            url = 'http://www.eenadu.net/' + url
        print s_no, url
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
        updatequery = "update eenadu set article_content = '" + l + "'"
        cursor.execute(updatequery)
        conn.commit() 
    return True

if __name__ == '__main__':
    result = scrape()
    if not result:
         print 'There was an error!'
    else:
         print (r"scrape job for the site www.eenadu.net has been done")