#!/usr/bin/python3
"""for a given employee ID, returns information about his TODO list"""

import json
import requests
from sys import argv


def get_todos(user_id):
    """get the list of todos of the user"""

    url = f"https://jsonplaceholder.typicode.com/users/{user_id}"

    r_user = requests.get(url)
    r_todo = requests.get(f"{url}/todos")

    if r_user.status_code == 200 and r_todo.status_code == 200:

        username = r_user.json().get('username')
        todos = r_todo.json()

        data = {user_id: []}
        for t in todos:
            data[user_id].append({'task': t.get('title'),
                                  'completed': t.get('completed'),
                                  'username': username})

        with open(f'{user_id}.json', 'w') as file:
            json.dump(data, file)

    else:
        print(f"Error: Unable to retrieve data")


if __name__ == "__main__":

    if len(argv) > 1:
        get_todos(argv[1])
