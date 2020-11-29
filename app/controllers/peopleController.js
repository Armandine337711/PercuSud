const {
    People
} = require("../models")

peopleController = {
    profs: async (request, response, next) => {
        try {
            const profs = await People.findAll();
            response.render('pres', {
                profs
            });
        } catch (error) {
            console.log(error)
            response.status(500).send(error);
        }



    },
    visitors: {}
};

module.exports = peopleController;