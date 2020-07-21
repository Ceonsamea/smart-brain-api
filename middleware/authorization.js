// TODO redis could be moved to server.js and passed as args (like db is) rather
// than imported from signin
const redisClient = require('../controllers/signin').redisClient;

// 'next' is a third param that comes with express. It allows us to keep
// ..going down the chain. For example, where it was called in server: 
//
// 		app.get('/profile/:id', auth.requireAuth, (req, res) => { profile.handleProfileGet(req, res, db)})
//
// after auth.requireAuth it will coninue to the next arg (req, res)

// return next to allow things to continue. Since middleware is intended to modify
// in the middle, we use next so that the things will continue like normal. However,
// if the user isn't authorized, we can return 401 so that the rest of the program
// will NOT run.
const requireAuth = (req, res, next) => {
	const { authorization } = req.headers;
	if (!authorization) {
		return res.status(401).json('Unauthorized');
	}
	return redisClient.get(authorization, (err, reply) => {
		if (err || !reply) {
			return res.status(401).json('Unauthorized');
		}
		console.log("You shall pass!")
		return next()
	})
}

module.exports = {
	requireAuth: requireAuth
}