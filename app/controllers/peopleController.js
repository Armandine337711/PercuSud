const peopleDataMapper = require('../dataMappers/peopleDataMapper');

const peopleController = {
    getProfs: async (request, response, next) => {

        try {

            const profs = await peopleDataMapper.getAllProfs();

            console.log(profs.firstname);
            let prez = [];
            response.render('pres', {
                people: profs,
                prez

            })
        } catch (error) {

        }
    },
    // visitors: async (request, response, next) => {
    //     try {

    //         const people = await People.findAll({
    //             where: {
    //                 role_id: 2
    //             },
    //             include: ['page']
    //         })
    //         let prez = [];

    //         response.render('pres', {
    //             people,
    //             prez

    //         })
    //     } catch (error) {

    //     }
    // }
};

module.exports = peopleController;