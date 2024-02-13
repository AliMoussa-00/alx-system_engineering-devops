#!/usr/bin/python3
"""
queries the Reddit API and prints a sorted count of given keywords
in the titles of all hot articles using RECURSIVE
"""

import requests


def count_words(subreddit, word_list):
    """the query function"""

    if not word_list:
        return None
    word_list = [s.lower() for s in word_list]
    word_list = list(set(word_list))
    word_dict = {}
    for w in word_list:
        word_dict[w] = 0

    word_count = recursive(subreddit, word_dict, after="")
    if word_count:
        word_count = dict(sorted(word_count.items(),
                                 key=lambda item: item[1], reverse=True))
        for w, c in word_count.items():
            if c > 0:
                print("{}: {}".format(w, c))


def recursive(subreddit, word_dict, after=""):
    """the recursive function"""

    if after is None:
        return word_dict

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {"user-agent": "Mozilla/5.0"}
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
                title = post.get("data").get("title").lower()

                for word, count in word_dict.copy().items():
                    word_dict[word] = count + title.count(word)

            return recursive(subreddit, word_dict, data.get("after"))
