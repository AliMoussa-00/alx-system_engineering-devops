#!/usr/bin/python3
"""
queries the Reddit API and returns a list containing
the titles of all hot articles using RECURSIVE
"""

import requests


def recurse(subreddit, after="", hot_list=[]):
    """the query function"""

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {"user-agent": "Mozilla/5.0"}

    if after is None:
        return hot_list

    r = requests.get(url,
                     params={"after": after},
                     headers=headers,
                     allow_redirects=False)

    if r.status_code != 200:
        return None

    else:
        data = r.json().get("data")
        if data:
            for post in data.get("children"):
                hot_list.append(post.get("data").get("title"))

            return recurse(subreddit, data.get("after"), hot_list)
