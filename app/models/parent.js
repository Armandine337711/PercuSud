const {
    Model,
    DataTypes
} = require('sequelize');
const sequelize = require('../database');

class Parent extends Model {}

Article.init({
    firstname: {
        type: DataTypes.TEXT,
        allowNulls: false,
        validate: {
            notEmpty: {
                msg: 'Il faut saisir un prénom'
            },
            isAlpha: true
        }
    },
    lastname: {
        type: DataTypes.TEXT,
        allowNulls: false,
        validate: {
            notEmpty: {
                msg: 'Il faut saisir un nom'
            },
            isAlpha: true
        }
    },
    birth_date: {
        type: DataTypes.DATE,
        allowNulls: false,
        validate: {
            notEmpty: {
                msg: 'Il faut saisir une date'
            },
            isDate: true
        }

    },
    adress: {
        type: DataTypes.TEXT,
        allowNulls: false,
        validate: {
            notEmpty: {
                msg: 'Il faut saisir une adress'
            },
            isAlphanumeric: true
        }
    },
    adress2: {
        type: DataTypes.TEXT,
        validate: {
            isAlphanumeric: true
        }

    },
    zip_code: {
        type: DataTypes.INTEGER,
        allowNulls: false,
        validate: {
            notEmpty: {
                msg: 'Il faut saisir un code postal'
            }
        }

    },
    city: {
        type: DataTypes.TEXT,
        allowNulls: false,
        validate: {
            notEmpty: {
                msg: 'Il faut saisir votre ville de résidence'
            },
            isAlpha: true,
            len: [5]
        }
    },
    phone: {
        type: DataTypes.INTEGER,
        allowNulls: false,
        validate: {
            notEmpty: {
                msg: 'Il faut saisir votre numéro de téléphone'
            },
            len: [10]

        }
    },
    mail: {
        type: DataTypes.TEXT,
        unique: true,
        allowNulls: false,
        validate: {
            notEmpty: {
                msg: 'Il faut saisir une adresse mail'
            },
            isEmail: true
        }
    }
}, {
    tableName: 'parent',
    sequelize
})