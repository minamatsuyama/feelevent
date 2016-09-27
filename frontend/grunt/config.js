var _ = require('lodash');
var config = {};

var grunt = global.grunt;
var target = grunt.option('target') || 'user';
console.log('target', target);

/*
 CSS
 */
if(target !== 'admin'){
  config = _.merge(config, require('./config.css.js'));
}else{
  config = _.merge(config, require('./admin/config.css.js'));
}

/*
 JS
 */
if(target !== 'admin'){
  config = _.merge(config, require('./config.js.js'));
}else{
  config = _.merge(config, require('./admin/config.js.js'));
}

/*
 Others
 */
config = _.merge(config, {
    //imagemin:   require('./grunt/imagemin')
});

/*
 Watch
 */
if(target !== 'admin'){
  config = _.merge(config, require('./config.watch.js'));
}else{
  config = _.merge(config, require('./admin/config.watch.js'));
}

module.exports = config;
