const {
    Model,
    DataTypes
} = require('sequelize');
const sequelize = require('../database');

class Article extends Model {}

Article.init({
    title: {
        type: DataTypes.TEXT,
        allownull: false,
        title: {
            type: DataTypes.TEXT,
            allownull: false,
            validate: {
                notEmpty: {
                    msg: `L'article doit avoir un titre`
                }
            }
        }
    },
    content: {
        type: DataTypes.TEXT,
        allownull: false,
        validate: {
            notEmpty: {
                msg: `L'article doit avoir un contenu`
            }
        }
    }


}, {
    tableName: 'article',
    sequelize
});
module.exports = Article;