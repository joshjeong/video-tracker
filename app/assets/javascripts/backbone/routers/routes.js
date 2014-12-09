var Router = Backbone.Router.extend({
  routes: {
    "movies" : "getMovies",
    "shows" : "getShows"
  },
  getMovies: function(){
    $('.shows-list').html('')
    // $('.show-header').addClass('no-display')
    // $('.movie-header').removeClass('no-display')
    var movie = new Movie();
    var movies = new Movies();
    movies.fetch({
        success: function(){
            var pageController = new Page.Controller(movies);
            pageController.init();
        }
    });
    var movieListView = new MovieListView({collection: movies});

  },
  getShows: function(){
    $('.movies-list').html('')
    // $('.movie-header').addClass('no-display')
    // $('.show-header').removeClass('no-display')

    var show = new Show();
    var shows = new Shows();
    shows.fetch({});
    var showListView = new ShowListView({collection: shows});

    // show.url = 'shows/1.json';
    // show.fetch({
    //   test to see if able to fetch from db
    //   success: function(){
    //     var showView = new ShowView({model: show});
    //     $('.shows-list').append(showView.render());
    //   }
    // });
  }
});

new Router();

Backbone.history.start();