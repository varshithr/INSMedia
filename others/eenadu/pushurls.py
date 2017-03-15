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


conn = connect(database="postgres", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()
url = 'http://www.eenadu.net/'

def slider():
    classifier = 'slider'
    query = """select link from eenadu_menu """ + """where s_no in (1,2,9)"""
    cursor.execute(query)
    urls = cursor.fetchall()
    for url in urls:
        url = url[0]
        #print url
        page = get(url)
        # we didn't get a valid response, bail
        if 200 != page.status_code:
            print 'failed getting data of page ' + url
            continue
        soup = Soup(page.content)
        
        figures = soup.findAll('figure')[1:20]
        #figures = soup.findAll('figure', class_ = "owl-item")
        # no figures? bail
        if not figures:
            print 'no slider images exist in the link ' + url
            continue
        print url
        for f in figures:
            ahrefs = f.findAll("a")
            try:
                arel = ahrefs[0]
                newsitem_link = arel.get('href')
                
                imgtxt = Soup(str(arel))
                imgtxt = imgtxt.find('img')
                image_link = imgtxt.get('src')
                
                text = ahrefs[1]
                text = str(text)
                text = Soup(text)
                display_title = text.find('a').string
                                         
                today = date.today()
                print newsitem_link, display_title, image_link, classifier, today
                query = """INSERT INTO eenadu (newsitem_link, display_title, 
                image_link, classifier, url_inserted_date) values (%s,%s,%s,%s,%s)"""
                cursor.execute(query,(newsitem_link, display_title, image_link, classifier, today))
            except IndexError:
                continue
            #print arel
        conn.commit()
         
    return True


if __name__ == '__main__':
    result = slider()
    if not result:
         print 'There was an error!'
    else:
         print ('Content updated to eenadu table' )
