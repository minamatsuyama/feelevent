module.exports = {
  //jslint:     require('./grunt/jslint'),
  qunit: {
    js_all:['<%= specPath %>/js/*.test.html']
  },
  concat:     {
    //create modules.js
    js_lib_vendor : {
      files : {
        '<%= destPath %>/js/lib/vendor.js': [
          '<%= srcPath %>/js/lib/vendor/jquery-3.1.0.min.js',
          '<%= srcPath %>/js/lib/vendor/underscore.min.js',
          '<%= srcPath %>/js/lib/vendor/backbone-min.js',
          '<%= srcPath %>/js/lib/vendor/velocity.min.js',
          '<%= srcPath %>/js/lib/vendor/slick.min.js',
          '<%= srcPath %>/js/lib/vendor/select2.full.min.js',
          '<%= srcPath %>/js/lib/vendor/jquery-ui.1.min.js',
          '<%= srcPath %>/js/lib/vendor/jquery-ui.2.datepicker-ja.js',
          '<%= srcPath %>/js/lib/vendor/vendor_setting.js'
        ]
      }
    },
    //create module.js
    js_lib_module : {
      files : {
        '<%= destPath %>/js/lib/module.js': ['<%= srcPath %>/js/lib/module/*.js']
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
    js_lib_module : {
      files: {
        '<%= destPath %>/js/lib/module.js': ['<%= destPath %>/js/lib/module.js']
      }
    },
    //copy other js-file to public
    js : {
      files: [{
        expand: true,
        cwd: '<%= srcPath %>/js',
        src: ['**/*.js', '!lib/**/*.js', '!shared/**/*.js', '!_*.js'],
        dest: '<%= destPath %>/js'
      }]
    }
  },
  copy: {
    js: {
      files: [{
        expand: true,
        cwd: '<%= destPath %>/js',
        src: ['**/*.js'],
        dest: '<%= exportPath %>/js'
      }]
    }
  }
};
