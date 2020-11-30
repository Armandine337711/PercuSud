const {
    People
} = require("../models")

peopleController = {
    profs: async (request, response, next) => {

        const profs = await People.findAll();
        //console.log(profs[0].presentation);

        let prez = [];


        response.render('pres', {
            profs,
            prez

        })
    }
    //visitors: {}
};

module.exports = peopleController;