module.exports = {
  sass : {
    css: {
      options: {
        sourcemap: 'none',
        style: 'expanded',
        noLineComment:false
      },
      files: [{
        expand: true,
        cwd: '<%= srcPath %>/admin/css',
        src: ['*.scss', '**/*.scss'],
        dest: '<%= destPath %>/admin/css',
        ext: '.css'
      }]
    }
  },
  copy: {
    css: {
      files: [{
        expand: true,
        cwd: '<%= destPath %>/admin/css',
        src: ['**/*.css'],
        dest: '<%= exportPath %>/admin/css'
      }]
    }
  }
};
