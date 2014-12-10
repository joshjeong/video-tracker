var ShowView = Backbone.View.extend({
    initialize: function(){
        if(this.model.get('watched')===true){
            this.$el.addClass('watched')
        }
    },
    tagName: 'li',
    className: 'row',
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
        return this.$el.html('<h4 class="col-md-10">'+this.model.get('title')+'</h4>'+'<div class= "thumbnail col-md-2"><img src='+this.model.get('image')+'></div>');
    }
});