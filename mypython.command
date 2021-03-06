#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup

response = requests.get('http://www.bbc.co.uk/news')
soup = BeautifulSoup(response.text, 'html.parser')

primary = soup.find('div',{'class': 'nw-c-top-stories-primary__story'} )
headline =primary.find('h3')
summary = primary.find('p')
link = primary.find('a')
print('Primary items')
print(headline.text)
print(summary.text)
print(link['href'])

secondaries = soup.find_all('div',{'class': 'nw-c-top-stories__secondary-item'} )
print('Secondary items')
for secondary in secondaries:
    headline = secondary.find('h3')
    summary = secondary.find('p')
    link = secondary.find('a')
    print(headline.text)
    if summary:
        print(summary.text)
    print(link['href'])

tertiary = soup.find('div',{'class': 'nw-c-top-stories__tertiary-items'})
print('Tertiary items')
stories = tertiary.find_all('div',{'class': 'gel-layout__item'})
for story in stories:
    headline = story.find('h3')
    print(headline.text)
    link = story.find('a')
    print(link['href'])


sport = soup.find('div',{'class': 'nw-c-sport'})
print('Sport items')
stories = sport.find_all('div', { 'class': 'gs-c-promo' })
for story in stories:
    headline = story.find('h3')
    print(headline.text)
    link = story.find('a')
    print(link['href'])

