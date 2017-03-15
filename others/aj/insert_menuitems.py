#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Mon Mar  6 11:19:39 2017

@author: venkatesh
"""

from requests import get
from BeautifulSoup import BeautifulSoup as Soup
import psycopg2

conn = psycopg2.connect(database="postgres", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()

url = 'http://www.andhrajyothy.com/'
page = get(url)
soup = Soup(page.content)
td = soup.find('div', id="bs-example-navbar-collapse-1")
td = str(td)
soup = Soup(td)
lis = soup.findAll('a')
#print lis
for li in lis:
    title = li.get('id')[3:]
    link = li.get('href')
    if link.startswith('http'):
        pass
    else:
        link = 'http://www.andhrajyothy.com/' + link
    print title, link
    insertquery = "insert into abn_menu (link,title) values (%s,%s)"
    cursor.execute(insertquery,(link,title))
    conn.commit() 
del td
del soup