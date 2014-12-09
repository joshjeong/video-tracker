Movie = Backbone.Model.extend({
    url: function(){
        return '/movies/' + this.get('id') + '.json'
    }
});