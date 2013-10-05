module.exports = (grunt) ->
  'use strict'

  pkg = grunt.file.readJSON('package.json')

  # Load dependancies
  dependencies = Object.keys(pkg.devDependencies).filter (o) ->
    /^grunt-.+/.test(o)

  for dep in dependencies
    grunt.loadNpmTasks(dep)

  grunt.initConfig
    pkg: pkg,

    #aCoffee Lint
    coffeelint:
      gruntfile:
        src: 'gruntfile.coffee'
        options:
          max_line_length:
            level: 'ignore'

    # Coffee to JS compilation
    coffee:
      dist:
        options:
          sourceMap: true
        files: [{
          expand: true,
          cwd: '<%= pkg.path.assets %>/scripts',
          src: '{,*/}*.coffee',
          dest: '.tmp',
          ext: '.js'
        }]

    # Manage Sass compilation
    sass:
      options:
        quiet: false,
        cacheLocation: '<%= pkg.path.scss %>/.sass-cache'
      dev:
        files:
          '<%= pkg.path.css %>/style.css': '<%= pkg.path.scss %>/style.scss'
      dist:
        options:
          style: 'compressed'
        files:
          '<%= pkg.path.css %>/style.min.css': '<%= pkg.path.scss %>/style.scss'

    # Optimise images
    imageoptim:
      files: [
        '<%= pkg.path.img %>'
      ],
      options:
        # also run images through ImageAlpha.app before ImageOptim.app
        imageAlpha: true,
        # also run images through JPEGmini.app after ImageOptim.app
        # jpegMini: true,
        # quit all apps after optimisation
        quitAfter: true

    # Optimise SVG's
    svgmin:
      options:
        full: true
        plugins: [{
          removeViewBox: false
          cleanUpIDs: false
        }]
      dist:
        files: [{
          expand: true
          cwd: '<%= pkg.path.img %>'
          src: ['**/*.svg']
          dest: '<%= pkg.path.img %>'
        }]

    # Execute shell commands
    shell:
      # Generate relative symlinks from styleguide to site assets
      styleguide:
        command: [
          'cd styleguide',
          'ln -s ../<%= pkg.path.css %>/style.css',
          'ln -s ../<%= pkg.path.assets %>/_fnt',
          'ln -s ../<%= pkg.path.img %>'
        ].join('&&'),
        options:
          stdout:true

      # Build KSS
      kss:
        command: [
          'rm -rf styleguide/docs',
          'kss-node styleguide/kss/docs styleguide/build --template styleguide/kss/template',
          'cd styleguide/build/public',
          'rm style.css',
          'ln -s ../../../<%= pkg.path.css %>/style.css',
          'ln -s ../../../<%= pkg.path.img %>',
          'ln -s ../../../<%= pkg.path.assets %>/_fnt',
          'ln -s ../../../<%= pkg.path.js %>'
        ].join('&&'),
        options:
          stdout: true

    # Run a local server
    connect:
      options:
        port: 9000,
        hostname: '0.0.0.0',
        base: 'styleguide/build',
        keepalive: true
      middleware: (connect, options) ->
        connect.static(options.base)

    clean:
      dist: ['<%= pkg.path.js %>', '.tmp']

    uglify:
      dist:
        files: {
          '<%= pkg.path.js %>/built.min.js': '<%= pkg.path.js %>/built.js'
        }

    # Watch configuration
    watch:
      gruntfile:
        files: 'Gruntfile.coffee',
        tasks: ['coffeelint']
      coffee:
        files: ['<%= pkg.path.assets %>/scripts/{,*/}*.coffee'],
        tasks: ['build-coffee', 'uglify:dist']
      js:
        files: ['<%= pkg.path.assets %>/scripts/**/*.js'],
        tasks: ['uglify:dist', 'copy:libs']
      css:
        files: ['<%= pkg.path.scss %>/**/*.scss'],
        tasks: ['sass']
      kss:
        files: ['styleguide/kss/**/*.*'],
        tasks: ['kss']

  grunt.registerTask('default', ['watch'])
  grunt.registerTask('kss', ['shell:kss'])
  grunt.registerTask('server', ['connect'])
  grunt.registerTask('optim', ['imageoptim', 'svgmin:dist'])
