# -*- coding: utf-8 -*-
"""
Created on Tue  14 14:23:53 2017

@author: Pragya
"""

import configparser
from TwitterAPI import TwitterAPI

def get_twitter(config_file):
    """ Read the config_file and construct an instance of TwitterAPI.
    Args:
      config_file ... A config file in ConfigParser format with Twitter credentials
    Returns:
      An instance of TwitterAPI.
    """
    config = configparser.ConfigParser()
    config.read(config_file)
    twitter = TwitterAPI(
                   config.get('twitter', 'consumer_key'),
                   config.get('twitter', 'consumer_secret'),
                   config.get('twitter', 'access_token'),
                   config.get('twitter', 'access_token_secret'))
    return twitter

twitter = get_twitter('C:/Users/jaide/Desktop/Pragya/Big data project/twitter.cfg')
print('Established Twitter connection.')

type(twitter)


import csv
import time
csvfile = "C:/Users/jaide/Desktop/Pragya/Big data project/output.txt"
for i in range(100): 
    #time.sleep(61 * 2)
    request = twitter.request('search/tweets', {'q': '24-09-2016'})
    if request.status_code == 200:
         tweets = [r['text'] for r in request]
         tweetsuser =[r['user'] for r in request]
         print('found %d tweets' % len(tweets))
         for j in range(0,len(tweets)):
             with open(csvfile, "a+", encoding="utf-8") as output:
                 writer = csv.writer(output, delimiter =' ', quotechar =' ', lineterminator = '\n')
                 writer.writerow(tweets[j]+"   end of this tweet"+ "\t")  
             with open(csvfile1, "a+", encoding="utf-8") as output:
                 writer = csv.writer(output, delimiter =' ', quotechar =' ', lineterminator = '\n')
                 writer.writerow(tweetsuser[j])
    else:
         print('Got error: %s \nsleeping for 15 minutes.' % request.text)
         time.sleep(61 * 15)  

    

       

