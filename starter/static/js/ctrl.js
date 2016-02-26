/* © Devon Rueckner 2016 */


// app namespaces
var app = app || {};
app.ctrl = {};


app.ctrl.getDetails = function(id) {
  $.ajax({
      url: 'api/movies/' + id,
      type: 'get',
    })
    .fail(function(jqXHR, textStatus, errorThrown) {
      console.log("LOOKUP ERROR", ([textStatus, errorThrown, jqXHR.responseText]).join('\n'));
    })
    .done(function(data, textStatus, jqXHR) {
      app.movie_map[id].details = data;
    })
    .always(function() {
      app.trigger('update');
    });
};

app.ctrl.selectMovie = function(id) {
  app.selected = id;
  app.trigger('update');

  if (id && !app.movie_map[id].details) {
    app.ctrl.getDetails(id);
  }
};

app.ctrl.setCritMin = function(x) {
  app.critics_min = x;
  app.updateAvailableList();
  app.trigger('update');
};

app.ctrl.setAudMin = function(x) {
  app.audience_min = x;
  app.updateAvailableList();
  app.trigger('update');
};

