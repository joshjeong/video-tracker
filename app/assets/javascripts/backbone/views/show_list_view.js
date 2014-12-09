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