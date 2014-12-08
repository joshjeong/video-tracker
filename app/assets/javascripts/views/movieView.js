var MovieView = Backbone.View.extend({
    tagName: 'li',
    template: _.template('<%= title %>'),
    events: {
        'click' : 'toggleWatched'
    },
    toggleWatched: function(){
        this.$el.toggleClass('watched');
        if(this.model.get('watched')==true){
            this.model.set({'watched': false}).save();
        }
        else{
            this.model.set({'watched': true}).save();
        }
    },
    render: function(){
        return this.$el.html(template({title: this.model.get('title')}))
        // return this.$el.text(this.model.get('title'));
    },
})
