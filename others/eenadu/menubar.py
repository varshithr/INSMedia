#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Fri Mar  3 15:55:43 2017

@author: venkatesh
"""
#from lxml import html
from bs4 import BeautifulSoup
import requests
from psycopg2 import connect

conn = connect(database="postgres", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()

page = requests.get('http://www.eenadu.net/')
soup = BeautifulSoup(page.content, "lxml")
links = soup.find("div", class_ = "menu")
links = str(links)
del soup
print 'after links'
soup = BeautifulSoup(links, "lxml")
arefs = soup.find_all("a")
aref_sp = arefs[10:19]
for a in aref_sp:
    title = a.split('/')[4]
    url = a
    query = """insert into eenadu_menu """