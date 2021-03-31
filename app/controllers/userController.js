const userController = {
    inscription: (request, response, next) => {
        response.render('inscription')

    },
    resume:(request, response, next) => {
        const newMusician = request.body;
        console.log(newMusician);
        response.render('resume', {newMusician})
    }
};

module.exports = userController