module.exports = {
  //jslint:     require('./grunt/jslint'),
  qunit: {
    js_all:['<%= specPath %>/js/*.test.html']
  },
  concat:     {
    //create modules.js
    js_lib_vendor : {
      files : {
        //'<%= destPath %>/admin/js/lib/vendor.js': ['<%= srcPath %>/admin/js/lib/vendor/*.js']
      }
    },
    //create module.js
    js_lib_module : {
      files : {
        //'<%= destPath %>/admin/js/lib/module.js': ['<%= srcPath %>/admin/js/lib/module/*.js']
      }
    }
  },
  uglify:     {
    options: {
      mangle:false,
      compress:false,
      beautify:true
    },
    //copy module.js to public
    /*
    js_lib_module : {
      files: {
        '<%= destPath %>/admin/js/lib/module.js': ['<%= destPath %>/admin/js/lib/module.js']
      }
    },*/
    //copy other js-file to public
    js : {
      files: [{
        expand: true,
        cwd: '<%= srcPath %>/admin/js',
        src: ['**/*.js', '!lib/**/*.js', '!shared/**/*.js', '!_*.js'],
        dest: '<%= destPath %>/admin/js'
      }]
    }
  },
  copy: {
    js: {
      files: [{
        expand: true,
        cwd: '<%= destPath %>/admin/js',
        src: ['**/*.js'],
        dest: '<%= exportPath %>/admin/js'
      }]
    }
  }
};
