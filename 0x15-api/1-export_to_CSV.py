#!/usr/bin/python3
"""for a given employee ID, returns information about his TODO list"""

import csv
import json
import requests
from sys import argv


def get_todos(user_id):
    """get the list of todos of the user"""

    url_user = f"https://jsonplaceholder.typicode.com/users/{user_id}"
    url_todo = f"https://jsonplaceholder.typicode.com/users/{user_id}/todos"

    r_user = requests.get(url_user)
    r_todo = requests.get(url_todo)

    if r_user.status_code == 200 and r_todo.status_code == 200:

        user = r_user.json().get('username')
        todos = r_todo.json()

        data = []
        for t in todos:
            data.append([user_id, user, t.get('completed'), t.get('title')])

        with open(f'{user_id}.csv', 'w') as file:
            writer = csv.writer(file)
            writer.writerows(data)

    else:
        print(f"Error: Unable to retrieve data")


if __name__ == "__main__":

    if len(argv) > 1:
        get_todos(argv[1])
