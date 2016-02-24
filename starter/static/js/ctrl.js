/* © Devon Rueckner 2016 */


// app namespaces
var app = app || {};
app.ctrl = {};


// show errors to the user
app.ctrl.handleAjaxError = function(jqXHR, textStatus, errorThrown, msg) {
  console.log(([textStatus, errorThrown, jqXHR.responseText]).join('\n'));
  app.state.errorText = msg + ": " + errorThrown;
  app.rootTag.update();
};