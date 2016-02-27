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

app.ctrl.select = function(id) {
  app.selected = id;
  app.trigger('update');

  if (id && !app.movie_map[id].details) {
    app.ctrl.getDetails(id);
  }
};

app.ctrl.setCritMin = function(x) {
  x = x < 0 ? 0 : x;
  x = x > 100 ? 100 : x;
  app.critics_min = Math.round(x);
  app.updateAvailableList();
  app.trigger('update');
};

app.ctrl.setAudMin = function(x) {
  x = x < 0 ? 0 : x;
  x = x > 100 ? 100 : x;
  app.audience_min = Math.round(x);
  app.updateAvailableList();
  app.trigger('update');
};

app.ctrl.save = function(id) {
  if (app.saved.indexOf(id) == -1) {
    app.saved.push(id);
  }

  // if was shelved, move it over
  var index = app.shelved.indexOf(id);
  if (index != -1) {
    app.shelved.splice(index, 1);
  }

  app.updateAvailableList();
  app.trigger('update');
};

app.ctrl.shelve = function(id) {
  if (app.shelved.indexOf(id) == -1) {
    app.shelved.push(id);
  }

  // if was saved, move it over
  var index = app.saved.indexOf(id);
  if (index != -1) {
    app.saved.splice(index, 1);
  }

  app.updateAvailableList();
  app.trigger('update');
};


app.ctrl.unsave = function(id) {
  var index = app.saved.indexOf(id);
  if (index != -1) {
    app.saved.splice(index, 1);
  }

  app.updateAvailableList();
  app.trigger('update');
};


app.ctrl.unshelve = function(id) {
  var index = app.shelved.indexOf(id);
  if (index != -1) {
    app.shelved.splice(index, 1);
  }

  app.updateAvailableList();
  app.trigger('update');
};


app.ctrl.setSearch = function(text) {
  app.search = text.toLowerCase();
  app.updateAvailableList();
  app.trigger('update');
};
