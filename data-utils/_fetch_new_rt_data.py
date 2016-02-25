import json
import os
import time
from rottentomatoes import RT

BOX_OFFICE_COUNTRIES = [
    "us",
    "in",
    "uk",
    "nl",
]

LIMIT = 50                      # max allowed by rotten tomatoes

OUTPUT_FILE = "download/more_movies.json"


def main():
    assert os.environ["RT_KEY"], "Your Rotten Tomatoes API key should be stored in the RT_KEY env var!"
    rt = RT()                   # NOTE: you should have your API key stored in RT_KEY before this will work

    movies = []
    link_template = ""

    for country in BOX_OFFICE_COUNTRIES:
        print "requesting box office hits for {}".format(country)
        r = rt.lists('movies', 'box_office', limit=LIMIT, country=country)
        movies += r['movies']
        link_template = link_template or r['link_template']

        time.sleep(10)          # respect our API limits!

    # to maintain compatibility with movies.json fields, our top level dict
    # should have the following fields:
    # total (int)
    # movies (list)
    # link_template (string)
    total = len(movies)
    result = {
        "total": total,
        "movies": movies,
        "link_template": link_template,
    }

    with open(OUTPUT_FILE, "w") as f:
        json.dump(result, f, indent=2, sort_keys=True)


if __name__ == "__main__":
    main()
