Show = Backbone.Model.extend({
    url: function(){
        return '/shows/' + this.get('id') + '.json'
    }
});