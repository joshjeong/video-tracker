$(document).ready(function(){
    var movie = new Movie();
    
    
    var movieView = new MovieView({model:movie})
    movieView.render();


    var movies = new Movies();


    movies.fetch({
        // success: function(){
        //     _.each(movies.models, function(model){
        //         view = new MovieView({model: model})
        //     //     var img = $('<img/>').attr({'src': model.get('image')})
        //         $('.movies_list').append(view.render())
        //     })
        // }
    });

    var MovieListView = Backbone.View.extend({

        initialize: function(){
            // Will listen for newly added movies and will call
            // addOne function to render
            this.collection.on('add', this.addOne, this);
            this.collection.on('reset', this.addAll, this);
        },
        addOne: function(movie){
            // each model with its own view
            var movieView = new MovieView({model: movie});
            $('.movies_list').append(movieView.render())
        },
        addAll: function(){
            // Will call addOne and pass 'this' for correct context
            this.collection.forEach(this.addOne, this);
        },
        render: function(){
            this.addAll();
        }

    });
    var movieListView = new MovieListView({collection: movies});




})