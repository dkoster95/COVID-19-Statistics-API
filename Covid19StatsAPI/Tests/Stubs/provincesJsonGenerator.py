import requests

url = "https://covid-19-statistics.p.rapidapi.com/provinces"

querystring = {"iso":"CHN"}

headers = {
    'x-rapidapi-key': "2a43f79623mshf4fdf6bff2304adp1d0b56jsn3886a99edd6b",
    'x-rapidapi-host': "covid-19-statistics.p.rapidapi.com"
    }

response = requests.request("GET", url, headers=headers, params=querystring)
data = response.content
with open('provinces.json', 'wb') as f:
    f.write(data)