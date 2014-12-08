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