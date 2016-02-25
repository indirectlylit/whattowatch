# Data Utilities

These scripts help download and process data to get it ready to be loaded into the database and rendered by the client.

## Requirements

Tested with Python 3.5.1. Install dependencies:

```
pip install -r requirements.txt
```

## Fetch data

You'll need a Rotten Tomatoes API key for this.

```
python _fetch_new_rt_data.py
```

### Jupyter Notebook

A notebook was used for data exploration and for downloading posters, generating sprite sheets, and creating data fixtures for Django's `loaddata` functionality.

To see and use the notebook, run:

```
jupyter notebook extract_data.ipynb
```
