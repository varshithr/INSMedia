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
from requests.auth import HTTPProxyAuth

requests.packages.urllib3.disable_warnings()

conn = connect(database="insmedia", user="postgres",
                        password="scriptbees1$", host="127.0.0.1", port="5432")
cursor = conn.cursor()


def scrape():
    #Change url_inserted_date every week here
    query1 = """select s_no, newsitem_link from posts where 
            paper = 'samayam' and
            url_inserted_date = current_date"""# + """ and s_no = 3741"""
    cursor.execute(query1)
    items = cursor.fetchall()
    for item in items:
        s_no = item[0]
        url = item[1]
        if url.startswith('http'):
            pass
        else:
            url = 'http://telugu.samayam.com' + url
        print s_no, url
        proxy_host = "proxy.crawlera.com"
        proxy_port = "8010"
        proxy_auth = HTTPProxyAuth("91fea83a64bf4766b238730764ebc6fc", "")
        proxies = {"https": "https://{}:{}/".format(proxy_host, proxy_port)}
        page = get(url, proxies=proxies, auth=proxy_auth,
                         verify='/home/venkatesh/Desktop/scraping/crawlera-ca.crt')
        if 200 != page.status_code:
            print 'failed getting site url data ' + url
            continue
        soup = Soup(page.content)
        try:
            display_title = soup.find('h1').text
            display_title = display_title.encode('utf-8')
        except AttributeError:
            continue
        print display_title
        try:
            img_url = soup.find('img', {'pg':'StoryVid'})
            img_url = img_url.get('src')
            print img_url
        except AttributeError:
            pass
        contents = soup.find('div', {'class':'Normal'}).text
        print contents
        updatequery = """update posts set (display_title, article_content,
        image_link) = (%s,%s, %s) where s_no = %s"""
        cursor.execute(updatequery,(display_title, contents, img_url, str(s_no)))
        conn.commit() 
    return True

def samayam_scrape():
    result = scrape()
    if not result:
         print 'There was an error!'
    else:
         print (r"scrape job for the site http://telugu.samayam.com/ has been done")

if __name__ == '__main__':
    samayam_scrape()