const {
    Model,
    DataTypes
} = require('sequelize');
const sequelize = require('../database');

class Role extends Model {}

Role.init({
    identity: {
        type: DataTypes.TEXT,
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
});

module.exports = Role;