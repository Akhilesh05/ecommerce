const httpProxy = require('http-proxy');

module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    proxy: {
      proxy1: {
        options: { // start proxy server, listening to the default port 9000
          router: {		// make it forward requests according to this table
            'localhost:3000/api': 'http://localhost:3000/',
          }
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-proxy');
};
