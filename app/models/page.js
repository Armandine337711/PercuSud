const {
    Mode,
    DataTypes
} = require('sequelize');
const sequelize = require('../database');

class Page extends Model {};

Page.init({
    title: {
        type: DataTypes.TEXT,
        allownull: false,
        validate: {
            notEmpty: {
                msg: 'La page doit avoir un titre'
            }
        }
    },
    subtitle: {
        type: DataTypes.TEXT,

    },
    published: {
        types: DataTypes.BOOLEAN
    }
}, {
    tableName: 'page',
    sequelize
});

module.exports = Page;