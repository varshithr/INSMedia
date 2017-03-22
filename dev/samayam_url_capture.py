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
import os

conn = connect(database="insmedia", user="postgres",
                         password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()
#url = 'http://www.eenadu.net/'
today = date.today()

def hotnews():
    page = get('http://telugu.samayam.com/')
    data = page.text
    soup = Soup(data)
    htnews = soup.find('div',{'data-vr-zone':'topnews'})
    htnews = str(htnews)
    news = Soup(htnews)
    classifier = 'topnews'
    for i in news.findAll('a'):
        newsitem_link = i.get('href')
        display_title = i.text
        print newsitem_link
        print display_title
        insertsamayam(newsitem_link, display_title,  classifier)


def othernews(page,url):
    classifier = url.split('/')[3]
    data = page.text
    soup = Soup(data)
    items = Soup(str(soup.find('div',{'class':'topmain'})))
    othernews = set(items.findAll('a'))
    #print othernews
    for news in othernews:
        newsitem_link = news.get('href')
        if newsitem_link is None:
            continue
        display_title = news.text
        print newsitem_link
        print display_title
        print classifier
        insertsamayam(newsitem_link, display_title,  classifier)
    return True

def insertsamayam(newsitem_link, display_title,  classifier):
    paper = 'samayam'
    query = """INSERT INTO posts (newsitem_link, display_title,
            classifier, url_inserted_date, paper) values (%s,%s,%s,%s,%s)"""
    cursor.execute(query,(newsitem_link, display_title, classifier, today, paper))
    conn.commit()

def samayam():
    result = hotnews()
    if not result:
             pass
    query = """select link from samayam_menu""" #+ """ where s_no in (4)"""
    cursor.execute(query)
    urls = cursor.fetchall()
    for url in urls:
        page = get(url[0])
        print url[0]
        if 200 != page.status_code:
            print 'failed getting data of page ' + url
            continue
        result = othernews(page,url[0])
        if not result:
             continue
    print r"Content updated to the Postgres table 'posts'"

if __name__ == '__main__':
    samayam()