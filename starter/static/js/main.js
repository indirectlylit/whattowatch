/* © Devon Rueckner 2016 */

/*
  `app` is initialized in index.html by the server.
  `app.sprites` and `app.movies` are already populated
*/

// app can trigger events
riot.observable(app);


// application state
app.selected = null; // id of movie show in lightbox, if applicable
app.search = "";
app.critics_min = 85;
app.audience_min = 85;
app.available = app.movies;
app.saved = [];
app.shelved = [];


// make a map for efficient look-up
// also, add an 'average' rating for sorting
app.movie_map = {};
app.movies.forEach(function(m) {
  app.movie_map[m.id] = m;
  m.avg_score = (m.audience_score + m.critics_score) / 2;
});

// sort movies by average rating
app.movies.sort(function(a, b) {
  if (a.avg_score < b.avg_score) {
    return 1;
  } else if (a.avg_score > b.avg_score) {
    return -1;
  }
  return 0;
});


app.updateAvailableList = function() {
  app.available = app.movies.filter(function(movie) {
    if (movie.critics_score < app.critics_min) {
      return false;
    } else if (movie.audience_score < app.audience_min) {
      return false;
    }
    return true;
  });
};

app.updateAvailableList();

// globally update views when the model changes
app.on('update', function() {
  app.rootTag.update();
});


// app initialization
$(function() {
  // compile tags
  riot.compile(function() {
    // get a reference to the main view
    app.rootTag = riot.mount('main')[0];
  });
});
