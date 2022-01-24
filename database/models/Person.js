module.exports = (sequelize, dataTypes) => {
  const alias = "Person";
  const cols = {
    id: {
      type: dataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: dataTypes.STRING,
    },
    last_name: {
      type: dataTypes.STRING,
    },
    age: {
      type: dataTypes.INTEGER,
    },
  };
  const config = {
    tableName: "person",
    timestamps: false,
  };

  const Person = sequelize.define(alias, cols, config);

  Person.associate = function (models) {
    Person.belongsToMany(models.Movies, {
      as: "movies",
      through: "movies_actors",
      foreignKey: "person_id",
      oterKey: "movies_id",
      timestamps: false,
    }),
      Person.belongsToMany(models.Movies, {
        as: "movies_dir",
        through: "movies_directors",
        foreignKey: "person_id",
        oterKey: "movies_id",
        timestamps: false,
      }),
      Person.belongsToMany(models.Movies, {
        as: "movies_prod",
        through: "movies_producers",
        foreignKey: "person_id",
        oterKey: "movies_id",
        timestamps: false,
      });
  };

  return Person;
};
