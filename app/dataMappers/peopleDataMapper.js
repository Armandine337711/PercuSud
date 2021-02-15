const client = require('../database');

const peopleDataMapper = {
    async getAllProfs() {
        console.log('test2');
        const result = await client.query('SELECT * FROM people JOIN page ON people.page_id=page.id WHERE people.role_id=1');
        if (result.rowCount == 0) {
            return null;
        }
        console.log(result.rows)
        return result.rows
    },
};

module.exports = peopleDataMapper;