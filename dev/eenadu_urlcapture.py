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
import logging
logging.basicConfig(filename='eenadu_urlcapture.log',level=logging.DEBUG)

logging.info('trying to establish a conneciton with database')
conn = connect(database="insmedia", user="postgres",
                     password="scriptbees1$", host="127.0.0.1", port="5432")
logging.debug('conncetion establish successfully.')
cursor = conn.cursor()

url = 'http://www.eenadu.net/'
today = date.today()

def slider(page,sliderpage):
    logging.info('entered into slider function')

    #url = url[0]
    #print url
    if not sliderpage:
        return False
    #print page,sliderpage
    soup = Soup(page.content)
    classifier = 'slider'
    figures = soup.findAll('figure')[1:20]
    #figures = soup.findAll('figure', class_ = "owl-item")
    # no figures? bail
    if not figures:
        print 'no slider images exist in the link ' + url
        return False
    print url
    for f in figures:
        ahrefs = f.findAll("a")
        try:
            logging.debug('trying to scrape from eenadu_urlcapture')
            arel = ahrefs[0]
            newsitem_link = arel.get('href')

            imgtxt = Soup(str(arel))
            imgtxt = imgtxt.find('img')
            image_link = imgtxt.get('src')

            text = ahrefs[1]
            text = str(text)
            text = Soup(text)
            display_title = text.find('a').string

            print newsitem_link, display_title, image_link, classifier, today
            query = """INSERT INTO eenadu (newsitem_link, display_title,
            image_link, classifier, url_inserted_date) values (%s,%s,%s,%s,%s)"""
            cursor.execute(query,(newsitem_link, display_title, image_link, classifier, today))
        except IndexError:
            logging.error('got IndexError error in eenadu_urlcapture')
            continue
        #print arel
    conn.commit()
    return True

def hotnews(page,sliderpage):
    # we didn't get a valid response, bail
    logging.info('entered into hotnews function')
    classifier = 'hotnews'
    if sliderpage:
        #the following code will read the newsitems from the latest news
        print "these are the latest news"
        soup=Soup(page.content)
        main = soup.find('article',{'class':'telugu_uni_body'})
        hrefs =str(main)
        soupm=Soup(hrefs)
        lis=soupm.findAll('a')
        for li in lis:
            newsitem_link = li.get('href')
            display_title = li.text
            print newsitem_link, display_title,  classifier
            inserteenadu(newsitem_link, display_title,  classifier)


        #the following code will scrape the newsitems from the latest news list
        print "these are latest from the list"
        ahrefs = soup.find('ul',{'class':'article-box-list'})
        ahrefs = str(ahrefs)
        soup = Soup(ahrefs)
        lis = soup.findAll('a')
        for li in lis:
             newsitem_link = li.get('href')
             display_title = li.text
             print newsitem_link, display_title,  classifier
             inserteenadu(newsitem_link, display_title,  classifier)

    else:

        soup = Soup(page.content)
        main = str(soup.find('div',{'id':'mainnews'}))
        soup = Soup(main)
        ahrefs = soup.findAll('a')
        ahrefs = set(ahrefs)
        for li in ahrefs:
            newsitem_link = li.get('href')
            display_title = li.text
            print newsitem_link, display_title,  classifier
            inserteenadu(newsitem_link, display_title,  classifier)
    del soup, main
    return True

def mostread():
    logging.info('entered into mostread function')
    url = 'http://www.eenadu.net/'
    page = get(url)
    print url
    if 200 != page.status_code:
        print 'failed getting data of page ' + url
        return False
    classifier = 'mostread'
    #the following code will scrape the newsitems which are the most read
    print "these are most read"
    soup=Soup(page.content)
    mostread = soup.findAll('section',{'class':'two-col-right-block box-shadow'})[2]
    mostread = str(mostread)
    soup = Soup(mostread)
    lis=soup.findAll('a')
    for most in lis:
        newsitem_link = most.get('href')
        if newsitem_link.startswith('..'):
            newsitem_link = newsitem_link.strip('..')[-1]
        display_title = most.text
        print newsitem_link, display_title,  classifier
        inserteenadu(newsitem_link, display_title,  classifier)
    del lis,soup
    return True

def inserteenadu(newsitem_link, display_title,  classifier):
    try:
        logging.info('trying to insert each row into database. ')
        paper = 'eenadu'
        query = """INSERT INTO posts (newsitem_link, display_title,
                classifier, url_inserted_date, paper) values (%s,%s,%s,%s, %s)"""
        cursor.execute(query,(newsitem_link, display_title, classifier, today, paper))
        conn.commit()

    except:
        logging.error('got an error in inserteenadu')


def eenadu():
    logging.info('entered into eenadu executable function')
    query = """select link,slider_page from eenadu_menu""" #+ """ where s_no in (4)"""
    cursor.execute(query)
    urls = cursor.fetchall()
    result = mostread()
    if not result:
             pass
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
    print r"Content updated to the Postgres table 'eenadu'"

if __name__ == '__main__':
    logging.debug('calling main function')
    eenadu()
