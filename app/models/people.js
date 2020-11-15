const {
    Model,
    DataTypes
} = require('sequelize');
const sequelize = require('../database');

class People extends Model {}

Article.init({
    identity: {
        types: DataTypes.TEXT,
        allownull: false,
        validate: {
            notEmpty: {
                msg: `Il faut saisir un nom`
            }
        }
    },
    photo: {
        types: DataTypes.TEXT,
        /* Trouver un moyen de vérifier l'extension du fichier */
    },
    presentation: {
        type: DataTypes.TEXT,

    },
    role: {
        type: DataTypes.TEXT

    }
}, {
    tableName: 'people',
    sequelize
});

module.exports = People;