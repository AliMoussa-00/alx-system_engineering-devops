#!/usr/bin/python3
"""queries the Reddit API and returns the number of subscribers """

import requests


def number_of_subscribers(subreddit):
    """the query function"""

    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    user_agent = {"user-agent": "Mozilla/5.0"}

    r = requests.get(url, headers=user_agent, allow_redirects=False)
    if r.status_code != 200:
        return 0
    else:
        data = r.json()
        if 'data' in data and 'subscribers' in data['data']:
            return data['data']['subscribers']
