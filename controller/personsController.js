const path = require('path');
const fs = require ('fs');
const db = require('../database/models');
const { Op } = require("sequelize");

let personsName= [];

const moviesController = {
    index: function(req, res){        
           
        db.Person.findAll({            
            include:[{association: 'movies'},{association: 'movies_dir'}, {association: 'movies_prod'}]
        })
        .then(persons =>{
            personsName=persons;
            res.render('personDetail', {persons})
        })
        
    },

    personDetail: function(req, res){      

        

       db.Person.findAll({
        where: {id:req.body.id},
        include:[{association: 'movies'},{association: 'movies_dir'}, {association: 'movies_prod'} ]
    })
    .then(person =>{
        
        res.render('persons', {person, personsName})
    })




    }
    
};

module.exports = moviesController;