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

url = 'http://telugu.greatandhra.com/index.php'
page = get(url)
soup = Soup(page.content)
td = soup.find('div', {'class':'great_andhra_main_menu_panel'})
td = str(td)
soup = Soup(td)
lis = soup.findAll('a')
#print lis
for li in lis:
    title = li.get('title')
    link = li.get('href')
    print title, link
    insertquery = "insert into ga_menu (link,title) values (%s,%s)"
    cursor.execute(insertquery,(link,title))
    conn.commit() 
del td
del soup