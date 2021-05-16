# Chartmetric API scraper
### Using bash shell, jq, and python to create CSV tables from returned JSON objects

The API is called using a batch `curl` request with two variables referencing `artist name` and `artist id` tables (not included in this repo).<br>
<br>
Those raw JSON are then iterated over using `jq` filters setup for each type of requested object, creating new filtered JSON of only the desired key : value pairs.<br>
<br>
Python is used to create and segment out individual tables, with headers based off of the dict keys. For batch processing:<br>
`$ find ./ -maxdepth 1 -type f -name "*.json" -exec ./chartmetric.py "{}" ../../temp \;`<br>
<br>
The generated objects can then be merged by `awk` to create a merged spreadsheet of data.<br>
`$ awk 'FNR == 1 && NR!=1{next;}{print}' *_metric.csv > merged.csv`
