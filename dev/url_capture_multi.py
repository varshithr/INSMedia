# -*- coding: utf-8 -*-

from sakshi_url_capture import sakshi
from eenadu_urlcapture import eenadu
from ga_url_capture import ga
from aj_urlcapture import abn
from tupaki_url_capture import tupaki
from aj_scrape import aj_scrape
from eenadu_scrape import eenadu_scrape
from ga_scrape import ga_scrape
from tupaki_scrape import tupaki_scrape
from samayam_url_capture import samayam
from oneindia_url_capture import oneindia
from oneindia_url_capture import oneindia_scrape
from concurrent.futures import ProcessPoolExecutor
from sakshi_scrape import sakshi_scrape

def callfunc(func):
    func()

def url_capture():
    papers = [ sakshi, eenadu, ga, abn, tupaki, samayam, oneindia ]
    e = ProcessPoolExecutor()
    e.map(callfunc, papers)
    return True

if __name__ == '__main__':
    
    r = url_capture()
    if r:
        oneindia_scrape()
        aj_scrape()
        tupaki_scrape()
        ga_scrape()
        eenadu_scrape()
        sakshi_scrape()
    else:
        print 'scraping failed'