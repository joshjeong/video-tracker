var Movies = Backbone.Collection.extend({
    model: Movie,
    url: "/movies.json"
});