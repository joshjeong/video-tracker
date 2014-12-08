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

    var movieListView = new MovieListView({collection: movies});




})