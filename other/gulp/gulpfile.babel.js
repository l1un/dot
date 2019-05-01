// ++ es6 - standard js - gulpfile.js (v0.2)

// ++ dev

'use strict'

import gulp from 'gulp'
import sass from 'gulp-sass'
import browserSync from 'browser-sync'
import htmlInjector from 'bs-html-injector'
import autoPrefixer from 'gulp-autoprefixer'

const dIr = {
  src: 'src',
  tmp: '.tmp',
  dist: 'dist'
}

const sRc = {
  scss: `${dIr.src}/scss/*.scss`
}

const dIst = {
  index: `${dIr.dist}/index.html`,
  css: `${dIr.dist}/css/`,
  js: `${dIr.dist}/js/*.js`,
  html: `${dIr.dist}/html/ugCh1.html`
}

// <gulp serve> - call sass, spin up server
gulp.task('serve', ['styles'], () => {
  // inject html *this is AWESOME - took time to debug !! note setup
  browserSync.use(htmlInjector, {
    files: dIst.index
  })
  // define options
  browserSync.init(null, {
    // browser: ['google chrome'],
    server: {
      baseDir: './',
      index: dIst.index
    }
  })
  // tasks to watch
  gulp.watch(sRc.scss, ['styles'])
  // gulp.watch(dIst.html).on('change', htmlInjector)
  gulp.watch(dIst.js).on('change', browserSync.reload)
})

// pull .scss from src + compile to .css in .tmp
gulp.task('styles', function () {
  return gulp.src(sRc.scss)
    .pipe(sass())
    .pipe(autoPrefixer())
    .pipe(gulp.dest(dIst.css))
    .pipe(browserSync.reload({stream: true}))
})

// ++ test

// ---> saved to create dir hierarchy

// *use npm install --save-dev require-dir
// require('require-dir')('./gulp')

// var open = require('gulp-open')

// gulp.task('browser', function () {
  // var options = {
    // uri: 'localhost:3000', // '/ugCh1.html',
    // app: 'firefox'
  // }
  // // files dIr + options arg
  // gulp.src('.tmp/index.html')
  // .pipe(open(options))
// })

// ---> saved for adding .tmp dir to workflow

// const temps = {
  // index: `${dIr.tmp}/index.html`,
  // css: `${dIr.tmp}/css/*.css`,
  // js: `${dIr.tmp}/js/*.js`,
  // html: `${dIr.tmp}/html/*.html`
// }
