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

if __name__ == '__main__':
    sakshi()
    eenadu()
    ga()
    abn()
    tupaki()
    samayam()
    oneindia()
    
    oneindia_scrape()
    aj_scrape()
    tupaki_scrape()
    ga_scrape()
    eenadu_scrape()
