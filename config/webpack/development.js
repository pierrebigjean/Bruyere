process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')


// add two lines to fix webpack issue
const config = environment.toWebpackConfig();
config.output.filename = "js/[name]-[hash].js"

module.exports = environment.toWebpackConfig()
