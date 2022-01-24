const path = require('path');
const fs = require ('fs');
const db = require('../database/models');
const Movies = db.Movies;
const { Op } = require("sequelize");

let moviesTitle= [];

const moviesController = {
    index: function(req, res){        
           
        db.Movies.findAll({            
            include:[{association: 'actors'},{association: 'directors'}, {association: 'producers'} ]
        })
        .then(movies =>{
            moviesTitle=movies;
            res.render('movieDetail', {movies})
        })
        
    },

    movieDetail: function(req, res){      

       db.Movies.findAll({
        where: {id:req.body.id},
        include:[{association: 'actors'},{association: 'directors'}, {association: 'producers'} ]
    })
    .then(movies =>{
        
        res.render('movies', {movies, moviesTitle})
    })




    }
    
};

module.exports = moviesController;