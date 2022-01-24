module.exports = (sequelize, dataTypes) => {
    const alias = 'Movies_directors';
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
        tableName: 'movies_directors',
        timestamps: false
    };
    
    const Movies_directors = sequelize.define(alias, cols, config);

            
    return Movies_directors

}