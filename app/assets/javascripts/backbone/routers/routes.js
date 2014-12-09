var Router = Backbone.Router.extend({
  routes: {
    "movies" : "getMovies"
  },
  getMovies: function(){
    var movie = new Movie();

    var movies = new Movies();

    movies.fetch({});

    var movieListView = new MovieListView({collection: movies});

  }
});

new Router();

Backbone.history.start();
