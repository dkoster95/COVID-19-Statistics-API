import requests

url = "https://covid-19-statistics.p.rapidapi.com/reports"

querystring = {"date":"2020-04-16","q":"Uruguay"}

headers = {
    'x-rapidapi-key': "2a43f79623mshf4fdf6bff2304adp1d0b56jsn3886a99edd6b",
    'x-rapidapi-host': "covid-19-statistics.p.rapidapi.com"
    }

response = requests.request("GET", url, headers=headers, params=querystring)
data = response.content
with open('reports.json', 'wb') as f:
    f.write(data)