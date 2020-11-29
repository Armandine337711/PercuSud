const {
    Model,
    DataTypes
} = require('sequelize');
const sequelize = require('../database');

class Formule extends Model {}

Formule.init({
    formule: {
        type: DataTypes.TEXT,
        allowNull: false,
        unique: true
    },
    price: {
        type: DataTypes.DECIMAL,
        allowNull: false


    }

}, {
    tableName: 'formule',
    sequelize
});

module.exports = Formule;