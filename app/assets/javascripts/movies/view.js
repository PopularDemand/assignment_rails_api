var APP = APP || {}

APP.movies = APP.movies || {}


APP.movies.view = (function() {
  var $moviesTBody, $movieForm;

  var init = function(handlers) {
    _setReactiveElements();
    $movieForm.submit(handlers.submit)
  };

  var _setReactiveElements = function() {
    $moviesTBody = $('#movies-list');
    $movieForm = $('#new_movie');
  };

  var createBatchTableData = function(movies) {
    movies.forEach(function(movie) {
      createTableRow(movie);
    });
  };

  var createTableRow = function(movie) {
    $tr = $('<tr>').addClass('movie-row');
    $title = $('<td>')
             .addClass('movie-title')
             .text(movie.title);
    $releaseDate =  $('<td>')
                   .addClass('release-date')
                  .text(movie.created_at)
    $tr.append($title).append($releaseDate);
    $moviesTBody.prepend($tr);
  }

  return {
    init: init,
    createBatchTableData: createBatchTableData,
    createTableRow: createTableRow
  }
}())