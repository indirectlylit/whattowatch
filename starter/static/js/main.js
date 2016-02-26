/* © Devon Rueckner 2016 */


// app namespaces
var app = app || {};


// app can trigger events
riot.observable(app);


// application state
app.state = {
  errorText: "",
  movies: [],
};

// app initialization
$(function() {
  // compile tags
  riot.compile(function() {
    // get a reference to the main view
    app.rootTag = riot.mount('main')[0];
  });
});