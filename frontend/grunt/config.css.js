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
        cwd: '<%= srcPath %>/css',
        src: ['*.scss', '**/*.scss'],
        dest: '<%= destPath %>/css',
        ext: '.css'
      }]
    }
  },
  copy: {
    css: {
      files: [{
        expand: true,
        cwd: '<%= destPath %>/css',
        src: ['**/*.css'],
        dest: '<%= exportPath %>/css'
      }]
    }
  }
};
