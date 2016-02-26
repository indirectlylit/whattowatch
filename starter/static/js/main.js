/* © Devon Rueckner 2016 */

/*
  `app` is initialized in index.html by the server.
  `app.sprites` and `app.movies` are already populated
*/

// app can trigger events
riot.observable(app);


// application state
app.selected = null; // id of movie show in lightbox, if applicable

app.movie_map = {};
app.movies.forEach(function(m) {
  app.movie_map[m.id] = m;
});


// globally update views when the model changes
app.on('update', function() {
  console.log('received command to update');
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
