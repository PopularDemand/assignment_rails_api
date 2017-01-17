var APP = APP || {}

APP.movies = APP.movies || {}

APP.movies.model = (function() {
  var movies = [];
  var init = function(callback) {
    requestMovies(callback)
  };

  var requestMovies = function(callback) {
    var moviesPromise = $.ajax('/movies.json')
      .then(_saveMovies)
    if (callback) {
      moviesPromise.then(callback)
    }
  };

  var addMovie = function(formData, callback) {
    console.log(formData)
    var moviePromise = $.ajax({
      url: '/movies',
      method: 'POST',
      data: formData,
      dataType: 'json',
      success: function(movieData){
        callback( movieData )
      }
    })
  }

  var getMovies = function() {
    return movies
  };

  var _saveMovies = function(movieData) {
    movies = [];
    movieData.forEach(function(movie) {
      movies.push(movie);
    })
    return movies
  };

  return {
    init: init,
    requestMovies: requestMovies,
    addMovie: addMovie,
    getMovies: getMovies
  }
}())
