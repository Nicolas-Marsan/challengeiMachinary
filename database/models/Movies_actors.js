module.exports = (sequelize, dataTypes) => {
    const alias = 'Movies_actors';
    const cols = {
        id: {
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        person_id: {
            type: dataTypes.INTEGER
        },
        movies_id: {
            type: dataTypes.INTEGER
        }
    };
    const config = {
        tableName: 'movies_actors',
        timestamps: false
    };
    
    const Movies_actors = sequelize.define(alias, cols, config);

    Movies_actors.associate = function(models){
    
        Movies_actors.belongsTo(models.Movies,{
            as: "moviess",
    
            foreignKey: "movies_id"
        }),
        Movies_actors.belongsTo(models.Person,{
            as: "persons",
    
            foreignKey: "person_id"
        });
    } 
            
    return Movies_actors

}