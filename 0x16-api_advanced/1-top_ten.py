#!/usr/bin/python3
"""queries the Reddit API and prints the titles of the first 10 hot posts"""

import requests


def top_ten(subreddit):
    """the query function"""

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {"user-agent": "Mozilla/5.0"}
    params = {"limit": 10}

    r = requests.get(url,
                     params=params,
                     headers=headers,
                     allow_redirects=False)

    if r.status_code != 200:
        print("None")
    else:
        data = r.json().get("data").get("children")
        if data:
            for post in data:
                print(post.get("data").get("title"))
        else:
            print("None")
