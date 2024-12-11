exports.handler = async (event) => {
    const { accountType, dateOfBirth } = event;

    // Simulated response
    const balance = Math.floor(Math.random() * 500);

    return {
        statusCode: 200,
        body: JSON.stringify({ accountType, dateOfBirth, balance }),
    };
};
