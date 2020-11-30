const {
    Model,
    DataTypes
} = require('sequelize');
const sequelize = require('../database');

class People extends Model {
    getFullname() {
        return `${this.firstname} ${this.lastname}`;
    }
}

People.init({
    firstname: {
        type: DataTypes.TEXT,
        allownull: false,
        validate: {
            notEmpty: {
                msg: `Il faut saisir un prénom`
            }
        }
    },
    lastname: {
        type: DataTypes.TEXT,
        allownull: false,
        validate: {
            notEmpty: {
                msg: `Il faut saisir un nom`
            }
        }
    },
    photo: {
        type: DataTypes.TEXT,
        /* Trouver un moyen de vérifier l'extension du fichier */
    },
    presentation: {
        type: DataTypes.TEXT,

    }

}, {
    tableName: 'people',
    sequelize
});

module.exports = People;