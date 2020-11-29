const {
    People
} = require("../models")

peopleController = {
    profs: async (request, response, next) => {

        const profs = await People.findAll();
        for (let i = 0; i < profs.length; i++) {

            console.log(profs[i++].photo);
            if (profs[i]) {
                console.log(profs[i].photo)
            }

            console.log('--------------')
        }





        response.render('pres', {
            profs
        })




    },
    visitors: {}
};

module.exports = peopleController;