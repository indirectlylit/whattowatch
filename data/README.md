# Data Pre-Load

These scripts help download and process data to get it ready to be loaded into the database.

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

A notebook was used for some initial data experimentation and exploration. To see and play with this, run:

```
jupyter notebook extract_data.ipynb
```

