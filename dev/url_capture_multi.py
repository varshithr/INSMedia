# -*- coding: utf-8 -*-

from sakshi_url_capture import sakshi
from eenadu_urlcapture import eenadu
from ga_url_capture import ga
from aj_urlcapture import abn
from tupaki_url_capture import tupaki
from samayam_url_capture import samayam
from oneindia_url_capture import oneindia
from concurrent.futures import ProcessPoolExecutor

def callfunc(func):
    func()

def url_capture():
    papers = [ sakshi, eenadu, ga, abn, tupaki, samayam, oneindia ]
    e = ProcessPoolExecutor()
    e.map(callfunc, papers)
    return True

if __name__ == '__main__':
    
    url_capture()
    