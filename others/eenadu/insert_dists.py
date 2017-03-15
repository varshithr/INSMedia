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

url = 'http://www.eenadu.net/home.aspx'
page = get(url)
soup = Soup(page.content)
td = soup.findAll('optgroup', id = 'ddlts')[0]
ad = soup.findAll('optgroup', id = 'ddlap')[0]

#print td, type(td)
td = str(td)
soup = Soup(td)
dists = soup.findAll('option')

#print td, type(td)
ad = str(ad)
soup = Soup(ad)
dists2 = soup.findAll('option')
dists = dists + dists2

for d in dists:
    #print d, type(d)
    link = d.get("value")
    title = link[26:]
    print link, title
    link = url + '/' + link
    insertquery = "insert into eenadu_menu (link,title) values (%s,%s)"
    cursor.execute(insertquery,(link,title))
    conn.commit() 