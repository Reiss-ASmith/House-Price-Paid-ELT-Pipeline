import sys
import requests
import pandas as pd

url = "http://prod.publicdata.landregistry.gov.uk.s3-website-eu-west-1.amazonaws.com/pp-complete.csv"

response = requests.get(url, stream=True)