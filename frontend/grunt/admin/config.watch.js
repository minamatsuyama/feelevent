module.exports = {
  watch : {
    js : {
      files: [
        '<%= srcPath %>/admin/js/**/*.js',
        '<%= srcPath %>/admin/js/*.js'
      ],
      tasks: ['js']
    },
    css : {
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
