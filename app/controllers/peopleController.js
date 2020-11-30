const {
    People
} = require("../models")

peopleController = {
    profs: async (request, response, next) => {

        const profs = await People.findAll({
            include: 'page'
        });
        console.log(profs[0]);

        let prez = [];


        response.render('pres', {
            profs,
            prez

        })
    }
    //visitors: {}
};

module.exports = peopleController;