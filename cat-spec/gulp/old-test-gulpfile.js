// ES5 - Standard Style JS - latest gulpfile test

// 1a. Tells Node to look into the node_modules folder for 'gulp' and
// assigns it variable name 'gulp'.
var gulp = require('gulp')
var sass = require('gulp-sass')
var browserSync = require('browser-sync').create()
// open in other browsers
var open = require('gulp-open')

// lets use firefox browser for testing
gulp.task('browser', function () {
  var options = {
    // no proxy ?
    uri: 'localhost:3000',
    // and how not to in chrome ?
    app: 'firefox'
  }
  // the files to open
  gulp.src('index.html')
  // and what options ?
  .pipe(open(options))
})

// 2. This task-name can be run in command line by typing 'gulp task-name'.
// 3a. Test function - try  ~$ <gulp sass> in command line to try it out.
// returns source, compiles SASS to CSS dir, inject new CSS styles
gulp.task('sass', function () {
  return gulp.src('scss/*.scss')
    .pipe(sass())
    .pipe(gulp.dest('css'))
    .pipe(browserSync.reload({
      stream: true
    }))
})

// Gulp task to fire up server and let browser-sync know root server
gulp.task('browserSync', function () {
  browserSync.init({
    server: {
      baseDir: './'
    }
  })
})

// browser-runs first, then sass, before 'watch 'watches tasks.
gulp.task('watch', ['browserSync', 'browser', 'sass'], function () {
  gulp.watch('scss/*.scss', ['sass']).on('change', browserSync.reload)
  // reloads browser when HTML / JS files change
  gulp.watch('*.html', browserSync.reload)
  gulp.watch('js/*.js', browserSync.reload)
  // Add other watchers here.
})
