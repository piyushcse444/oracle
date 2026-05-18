import requests

session = requests.session()
url = "http://192.168.2.214:8000/Bank_API_PowerQuery_Training.xlsx"
response = session.get(url,verify = False)
print(response.status_code)
print(response.text)


with open('data.xls','w',encoding = 'utf-8') as f:
    f.write(response.text)

