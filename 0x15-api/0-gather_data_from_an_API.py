#!/usr/bin/python3
"""for a given employee ID, returns information about his TODO list"""

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

        user = r_user.json().get('name')
        todos = r_todo.json()
        completed = list(filter(lambda todos: todos.get('completed'), todos))
        n_todos = len(todos)
        n_completed = len(completed)

        print(f"Employee {user} is done with tasks({n_completed}/{n_todos}):")
        for t in completed:
            print(f"\t {t.get('title')}")

    else:
        print(f"Error: Unable to retrieve data")


if __name__ == "__main__":

    if len(argv) > 1:
        get_todos(argv[1])
