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
    query1 = """select s_no, newsitem_link from posts 
    where url_inserted_date = current_date and
    paper = 'sakshi'""" #+ """ and s_no = 3178"""
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
            display_title = soup.find('h2').text
            display_title = display_title.encode('utf-8')
        except AttributeError:
            print 'in exc'
            pass
        print display_title
        try:
            img_url = soup.find('img', {'class':'imgbrd_left lazy'})
            img_url = img_url.get('src')
            print img_url
        except AttributeError:
            pass
        try:
            contents = soup.find('p', {'style':'text-align: justify;'}).text
        except AttributeError:
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
    return True

def sakshi_scrape():
    result = scrape()
    if not result:
         print 'There was an error!'
    else:
         print (r"scrape job for the site www.sakshi.com has been done")

if __name__ == '__main__':
    sakshi_scrape()