module.exports = {
  watch : {
    js_admin: {
      files: [
        '<%= srcPath %>/admin/js/**/*.js',
        '<%= srcPath %>/admin/js/*.js'
      ],
      tasks: ['js']
    },
    css_admin : {
      options: {
        livereload: true
      },
      files: [
        '<%= srcPath %>/admin/css/**/*.scss'
      ],
      tasks: ['css']
    }
  }
};
