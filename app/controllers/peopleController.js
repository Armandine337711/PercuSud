const {
    People
} = require("../models")

peopleController = {
    profs: async (request, response, next) => {
        try {

            const people = await People.findAll({
                where: {
                    role_id: 1
                },
                include: ['page']
            })
            let prez = [];

            response.render('pres', {
                people,
                prez

            })
        } catch (error) {

        }
    },
    visitors: async (request, response, next) => {
        try {

            const people = await People.findAll({
                where: {
                    role_id: 2
                },
                include: ['page']
            })
            let prez = [];

            response.render('pres', {
                people,
                prez

            })
        } catch (error) {

        }
    }
};

module.exports = peopleController;