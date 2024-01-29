#!/usr/bin/python3
"""for a given employee ID, returns information about his TODO list"""

import json
import requests


def get_todos():
    """get the list of todos of the user"""

    url = f"https://jsonplaceholder.typicode.com"

    r_users = requests.get(f"{url}/users")
    r_todos = requests.get(f"{url}/todos")

    if r_users.status_code == 200 and r_todos.status_code == 200:

        users = r_users.json()
        todos = r_todos.json()

        data = {}
        for user in users:
            user_id = user.get('id')
            data[user_id] = []

            for t in todos:
                if user_id == t.get('userId'):
                    data[user_id].append({'username': user.get('username'),
                                          'task': t.get('title'),
                                          'completed': t.get('completed')})

        with open('todo_all_employees.json', 'w') as file:
            json.dump(data, file)

    else:
        print(f"Error: Unable to retrieve data")


if __name__ == "__main__":
    get_todos()
