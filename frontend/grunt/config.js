var _ = require('lodash');
var config = {};

/*
 CSS
 */
config = _.merge(config, require('./config.css.js'));

/*
 JS
 */
config = _.merge(config, require('./config.js.js'));

/*
 Others
 */
config = _.merge(config, {
    //imagemin:   require('./grunt/imagemin')
});

/*
 Watch
 */
config = _.merge(config, require('./config.watch.js'));

module.exports = config;
