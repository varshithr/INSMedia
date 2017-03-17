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
home = 'http://www.sakshi.com/'
today = date.today()

def newslist(page, sliderpage, url):
    if sliderpage:
        return False
    else:
        if (url.find('district') == -1):
             classifier = url.split('-')[-1]
        else:
            classifier = url.split('=')[-1]
        print classifier
        soup=Soup(page.content)
        main=soup.findAll('div',{'class':'opinion_listing'})[0]
        main=str(main)
        soup=Soup(main)
        first = True
        for i in soup.findAll('a'):
            if not first:
                 first = True
                 continue
            else:
                 first = False
            link = i.get('href')
            print link
            insertsakshi(link,classifier)
    return True;

def slider(page, sliderpage):
    classifier = 'slider'
    if not sliderpage:
        return False
    else:
         soup = Soup(page.content)
         ul = str(soup.find('ul', {'class':'slider'}))
         soup = Soup(ul)    
         lis = soup.findAll('a')
         first = True
         for a in lis:
            if not first:
                 first = True
                 continue
            else:
                 first = False
            newsitem_link = a.get('href')
            print newsitem_link, classifier
            insertsakshi(newsitem_link, classifier)
    return True

def hotnews():
    page = get(home)
    if 200 != page.status_code:
        print 'failed getting data of page ' + home
        return False
    classifier = "hotnews"
    soup = Soup(page.content)
    div = str(soup.find('div', {'class':'widget col-xs-12 col-sm-12 col-md-12'}))
    #print div
    soup = Soup(div)
    ahrefs = soup.findAll('a')
    ahrefs = ahrefs[1:-4]
    for a in ahrefs:
        newsitem_link = a.get('href')
        print newsitem_link, classifier
        insertsakshi(newsitem_link, classifier)
    return True

def insertsakshi(newsitem_link, classifier):
    paper = 'sakshi'
    query = """INSERT INTO posts (newsitem_link,classifier, 
    url_inserted_date, paper) values (%s,%s,%s,%s)"""
    cursor.execute(query,(newsitem_link,  classifier, today, paper))
    conn.commit()


def sakshi():
    query = """select link,sliderpage from sakshi_menu""" #+ """ where s_no in (1)"""
    cursor.execute(query)
    urls = cursor.fetchall()
    for url in urls:
        page = get(url[0])
        print url[0]
        if 200 != page.status_code:
            print 'failed getting data of page ' + url
            continue
        result = slider(page,url[1])
        result = newslist(page,url[1], url[0])
        if not result:
             continue
    result = hotnews()
    if not result:
             pass
    print r"Content updated to the Postgres table 'posts'"

if __name__ == '__main__':
    sakshi()
