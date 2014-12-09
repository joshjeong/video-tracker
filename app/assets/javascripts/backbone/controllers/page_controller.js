Page.Controller = function(movies){
    this.movies = movies;
};

Page.Controller.prototype = {
    init: function(){
        this.bindListeners();
    },
    bindListeners: function(){
        var self = this;
        $('.list').on('mouseenter', 'img', function(){
            self.showOverviewListener($(this));
        });
        $('.list').on('mouseleave', 'img', function(){
            self.hideOverviewListener($(this));
        });
    },
    showOverviewListener: function(img_tag){
        this.showOverview(img_tag);
    },
    showOverview: function(img_tag){
        var image = img_tag.attr('src'),
            movie = this.movies.where({image: image})[0],
            overview = movie.get('overview')
        img_tag.parent().siblings().html(overview)
    },
    hideOverviewListener: function(img_tag){
        this.hideOverview(img_tag);
    },
    hideOverview: function(img_tag){
        var image = img_tag.attr('src'),
            movie = this.movies.where({image: image})[0],
            title = movie.get('title')
            console.log(title)
        img_tag.parent().siblings().html(title)
    }
}


Page.View = function(){};


Page.View.prototype = {}