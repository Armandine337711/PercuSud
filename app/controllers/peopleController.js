const {
    People
} = require("../models")

peopleController = {
    profs: async (request, response, next) => {

        const profs = await People.findAll({
            where: {
                role_id: 1
            },
            include: ['page']


        })



        let prez = [];


        response.render('pres', {
            profs,
            prez

        })
    }
    //visitors: {}
};

module.exports = peopleController;