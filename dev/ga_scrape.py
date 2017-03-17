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

conn = connect(database="insmedia", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()


def scrape():
    #Change url_inserted_date every week here
    query1 = """select s_no, newsitem_link from posts where 
            paper = 'greatandhra' and
            url_inserted_date = current_date""" #+ """ and s_no = 2"""
    cursor.execute(query1)
    items = cursor.fetchall()
    for item in items:
        s_no = item[0]
        url = item[1]
        print s_no, url
        page = get(url)
        if 200 != page.status_code:
            print 'failed getting site url data ' + url
            continue
        soup = Soup(page.content)
        try:
            img_url = soup.find('div', {'class':'todays_picture'})
            img = str(img_url)
            img = soup.find('img')
            img_url = img.get('src')
            print img_url
        except AttributeError:
            pass
        try:
            contents = soup.find('div', {'class':'content'}).text
        except AttributeError:
            continue
        left = contents.find('Go to www')
        contents = contents[:left]
        print contents
        updatequery = """update posts set (article_content,
        image_link) = (%s,%s) where s_no = %s"""
        cursor.execute(updatequery,( contents, img_url, str(s_no)))
        conn.commit() 
    return True

def ga_scrape():
    result = scrape()
    if not result:
         print 'There was an error!'
    else:
         print (r"scrape job for the site www.greatandhra.com has been done")

if __name__ == '__main__':
    ga_scrape()