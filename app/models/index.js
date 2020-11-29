const People = require('./people');
const Role = require('./role');
const Student = require('./student');
const Parent = require('./parent');
const Formule = require('./formule');
const Page = require('./page');
const Article = require('./article');

// ----------------
// Relation page-artcle
// ----------------
Page.hasMany(Article, {
    foreignKey: 'page_id',
    as: 'pages'
});

Article.belongsTo(Page, {
    foreignKey: 'page_id',
    as: 'articles'
})

// ----------------
// Relation people-role
// ----------------

Role.hasMany(People, {
    foreignKey: 'role_id',
    as: 'choucroute'
});

People.belongsTo(Role, {
    foreignKey: 'role_id',
    as: 'pdt'
});

// ----------------
// Relation student-formule
// ----------------

Formule.hasMany(Student, {
    foreignKey: 'formule_id',
    as: 'formules'
});

Student.belongsTo(Formule, {
    foreignKey: 'formule_id',
    as: 'student'
});

// ----------------
// Relation student-parent
// ----------------

Parent.hasMany(Student, {
    foreignKey: 'parent_id',
    as: 'parents'
});

Student.belongsTo(Parent, {
    foreignKey: 'parent_id',
    as: 'students'
});

module.exports = {
    Article,
    Page,
    Formule,
    Student,
    Parent,
    Role,
    People
}