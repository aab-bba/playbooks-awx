#!/usr/bin/env python3
import json
import requests
import argparse

# URL de tu API Flask
API_URL = "http://T04-00-Ubuntu.local:5000/inventario"

def get_inventory():
    try:
        response = requests.get(API_URL)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        return {"_meta": {"hostvars": {}}, "all": {"hosts": []}}

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--list', action='store_true')
    parser.add_argument('--host')
    args = parser.parse_args()

    inventory = get_inventory()

    if args.host:
        # Si se solicita información de un host específico
        print(json.dumps(inventory.get("_meta", {}).get("hostvars", {}).get(args.host, {})))
    elif args.list:
        # Listar todos los hosts
        print(json.dumps(inventory))
    else:
        # Por defecto, listar todos
        print(json.dumps(inventory))

if __name__ == "__main__":
    main()