var Router = Backbone.Router.extend({
  routes: {
    "movies" : "getMovies",
    "shows" : "getShows"
  },
  getMovies: function(){
    $('.shows-list').html('')
    $('.show-header').addClass('no-display')
    $('.movie-header').removeClass('no-display')
    var movie = new Movie();
    var movies = new Movies();
    movies.fetch({});
    var movieListView = new MovieListView({collection: movies});
  },
  getShows: function(){
    $('.movies-list').html('')
    $('.movie-header').addClass('no-display')
    $('.show-header').removeClass('no-display')

    Show = Backbone.Model.extend({})


    // show.url = 'shows/1.json';
    // show.fetch({
    //   test to see if able to fetch from db
    //   success: function(){
    //     var showView = new ShowView({model: show});
    //     $('.shows-list').append(showView.render());
    //   }
    // });

    ShowView = Backbone.View.extend({
      initialize: function(){
        if(this.model.get('watched')===true){
          this.$el.addClass('watched')
        }
      },
      tagName: 'li',
      events: {
        'click' : 'toggleWatched'
      },
      toggleWatched: function(){
        this.$el.toggleClass('watched');
        if(this.model.get('watched')===true){
          this.model.set({watched: false}).save();
        }
        else{
          this.model.set({watched: true}).save();
        }
      },
      render: function(){
        return this.$el.html('<h4>'+this.model.get('title')+'</h4>'+'<div class= "thumbnail"><img src='+this.model.get('image')+'></div>');
      }
    });

    Shows = Backbone.Collection.extend({
      model: Show,
      url: '/shows'
    });

    var ShowListView = Backbone.View.extend({
        initialize: function(){
            this.collection.on('add', this.addOne, this);
            this.collection.on('reset', this.addAll, this);
        },
        addOne: function(show){
            // each model with its own view
            var showView = new ShowView({model: show});
            $('.shows-list').append(showView.render())
        },
        addAll: function(){
            // Will call addOne and pass 'this' for correct context
            this.collection.forEach(this.addOne, this);
        },
        render: function(){
            this.addAll();
        }
    });

    
    var show = new Show();
    var shows = new Shows();
    shows.fetch({});

    var showListView = new ShowListView({collection: shows});

  }
});

new Router();

Backbone.history.start();
