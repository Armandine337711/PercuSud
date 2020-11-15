const {
    Model,
    DataTypes
} = require('sequelize');
const sequelize = require('../database');

class Formule extends Model {}

Article.init({
    formule: {
        type: DataTypes.TEXT,
        allowNull: false,
        unique: true
    },
    price: {
        type: DataTypes.FLOAT

    }

}, {
    tableName: 'article',
    sequelize
});

module.exports = Formule;