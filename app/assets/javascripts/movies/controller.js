var APP = APP || {}

APP.movies = APP.movies || {}

APP.movies.controller = (function() {
  var init = function(model, view) {
    model.init(view.createBatchTableData);
    view.init(_handlers);
  };


  var _formSubmit = function(e) {
    e.preventDefault();
    var movieData = $(e.target).serializeArray();
    APP.movies.model.addMovie(movieData, APP.movies.view.createTableRow);
  };

  var _handlers = {
    submit: _formSubmit
  };

  return {
    init: init,
    _handlers: _handlers
  }
}())


$(document).ready(function() {
  if ( $('#movies-index').length ) {
    APP.movies.controller.init(APP.movies.model, APP.movies.view);
  }
})