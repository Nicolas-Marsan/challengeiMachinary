module.exports = (sequelize, dataTypes) => {
    const alias = 'Movies_producers';
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
        tableName: 'movies_producers',
        timestamps: false
    };
    
    const Movies_producers = sequelize.define(alias, cols, config);

            
    return Movies_producers

}