(function() {
  var _ = require('lodash');

  module.exports = function(grunt) {
    global.grunt = grunt;

    var config = _.merge({
      srcPath:  './src',
      specPath: './spec',
      destPath: './public',
      exportPath: '../public'
    },  require('./grunt/config.js'));

    grunt.initConfig(config);

    var PACKAGE_JSON = grunt.file.readJSON("package.json");

    // Load Grunt Plugins
    Object.keys(PACKAGE_JSON.devDependencies).map(function(name){
      if(name.match('grunt-')){
        grunt.loadNpmTasks(name);
      }
    });

    //-------------------------------------------

    /*
     Setup tasks
     */

    grunt.registerTask('test', ['qunit']);
    grunt.registerTask('css',  ['sass', 'copy:css']);
    grunt.registerTask('js',   ['qunit', 'concat', 'uglify', 'copy:js']);

    grunt.registerTask('build',['css', 'js', 'copy']);

    grunt.registerTask('default', ['build']);

    /*
     Shortcut tasks
     */
    grunt.registerTask('w', ['watch']);
    grunt.registerTask('c', ['css']);
    grunt.registerTask('j', ['js']);
    grunt.registerTask('t', ['test']);

    grunt.registerTask('b', ['build']);
  };
})();
