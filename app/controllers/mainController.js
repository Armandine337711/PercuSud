const mainController = {
    home: (request, response, next) => {
        response.render('home');
    },
    notFound: (request, response) => {
        response.status(404).render('404');
    }
};

module.exports = mainController