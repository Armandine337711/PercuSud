const {
    Model,
    DataTypes
} = require('sequelize');
const sequelize = require('../database');

class Role extends Model {}

Article.init({
    identity: {
        types: DataTypes.TEXT,
        allownull: false,
        validate: {
            notEmpty: {
                msg: `Le champ 'rôle' est obligatoire`
            }
        }
    },
}, {
    tableName: 'role',
    sequelize
})