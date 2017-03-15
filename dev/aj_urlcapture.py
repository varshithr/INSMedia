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

conn = connect(database="insmedia", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()
#url = 'http://www.andhrajyothy.com/'
today = date.today()

def hotnews(page,sliderpage):
    classifier = "hotnews"
    if not sliderpage:
        soup = Soup(page.content)
        div = str(soup.find('div', {"class":"w-100 fl bg-white b-grey-1 p-3 news-panel"}))
        soup = Soup(div)
        ahrefs = soup.findAll('a')
        del soup, div
        for a in ahrefs:
            #print a[i]
            newsitem_link = a.get('href').split('/')[-1]
            newsitem_link = newsitem_link.encode('utf-8')
            display_title = a.text.encode('utf-8')
            print newsitem_link,  display_title
            insertabn(newsitem_link, display_title,  classifier)
    else:
        soup = Soup(page.content)
        #print soup
        div = str(soup.find('div', {'class':'w-100 fl b-grey-1'}))
        #print div
        soup = Soup(div)
        ahrefs = soup.findAll('a')
        try:
            ahrefs.pop()
        except IndexError:
            return False
        del soup, div
        for a in ahrefs:
            #print a[i]
            newsitem_link = a.get('href').split('/')[-1]
            newsitem_link = newsitem_link.encode('utf-8')
            display_title = a.text.encode('utf-8')
            display_title = display_title.split('[')[0]
            if (len(newsitem_link) == 1) or display_title == "":
                continue
            else:
                print newsitem_link,  display_title
                insertabn(newsitem_link, display_title,  classifier)
        
    return True

def slider(page,sliderpage):
    if not sliderpage:
        return False
    classifier = "slider"
    soup = Soup(page.content)
    div = str(soup.find('div', {'data-u':'slides'}))
    #print div
    soup = Soup(div)
    #print ahrefs
    ahrefs = soup.findAll('a')
    display_title = None
    for a in ahrefs:
        newsitem_link = a.get('href').split('/')[-1]
        newsitem_link = newsitem_link.encode('utf-8')
        print newsitem_link
        insertabn(newsitem_link, display_title,  classifier)
    return True

def insertabn(newsitem_link, display_title,  classifier):
    paper = 'andhra jyothi'
    query = """INSERT INTO posts (newsitem_link, display_title,
            classifier, url_inserted_date, paper) values (%s,%s,%s,%s, %s)"""
    cursor.execute(query,(newsitem_link, display_title, classifier, today, paper))
    conn.commit()


def abn():
    query = """select link,sliderpage from abn_menu""" #+ """ where s_no in (1)"""
    cursor.execute(query)
    urls = cursor.fetchall()
    for url in urls:
        page = get(url[0])
        print url[0]
        if 200 != page.status_code:
            print 'failed getting data of page ' + url
            continue
        result = slider(page,url[1])
        result = hotnews(page,url[1])
        if not result:
             continue
    print r"Content updated to the Postgres table 'abn'"

if __name__ == '__main__':
    abn()
