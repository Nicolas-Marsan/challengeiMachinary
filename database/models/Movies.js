module.exports = (sequelize, dataTypes) => {
  const alias = "Movies";
  const cols = {
    id: {
      type: dataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    title: {
      type: dataTypes.STRING,
    },
    year: {
      type: dataTypes.INTEGER,
    },
  };
  const config = {
    tableName: "movies",
    timestamps: false,
  };

  const Movies = sequelize.define(alias, cols, config);

  Movies.associate = function (models) {
    Movies.belongsToMany(models.Person, {
      as: "actors",
      through: "movies_actors",
      foreignKey: "movies_id",
      oterKey: "person_id",
      timestamps: false,
    }),
      Movies.belongsToMany(models.Person, {
        as: "directors",
        through: "movies_directors",
        foreignKey: "movies_id",
        oterKey: "person_id",
        timestamps: false,
      }),
      Movies.belongsToMany(models.Person, {
        as: "producers",
        through: "movies_producers",
        foreignKey: "movies_id",
        oterKey: "person_id",
        timestamps: false,
      });
  };

  return Movies;
};
