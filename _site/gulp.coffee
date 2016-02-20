gulp = require('gulp')
browserSync = require('browser-sync')
sass = require('gulp-sass')
prefix = require('gulp-autoprefixer')
cp = require('child_process')

jekyll = if process.platform == 'win32' then 'jekyll.bat' else 'jekyll'

messages = jekyllBuild: '<span style="color: grey">Running:</span> $ jekyll build'

###*
# Build the Jekyll Site
###
gulp.task 'jekyll-build', (done) ->
  browserSync.notify messages.jekyllBuild
  cp.spawn(jekyll, [ 'build' ], stdio: 'inherit').on 'close', done

###*
# Rebuild Jekyll & do page reload
###
gulp.task 'jekyll-rebuild', [ 'jekyll-build' ], ->
  browserSync.reload()
  return

###*
# Wait for jekyll-build, then launch the Server
###
gulp.task 'browser-sync', [
  'sass'
  'coffee'
  'jekyll-build'
], ->
  browserSync server: baseDir: '_site'
  return

###*
# Compile files from _scss into both _site/css (for live injecting) and site (for future jekyll builds)
###
gulp.task 'sass', ->
  gulp.src('_scss/main.scss').pipe(sass(
    includePaths: [ 'scss' ]
    onError: browserSync.notify)).pipe(prefix([
    'last 15 versions'
    '> 1%'
    'ie 8'
    'ie 7'
  ], cascade: true))
  .pipe(gulp.dest('_site/css'))
  .pipe(browserSync.reload(stream: true))
  .pipe gulp.dest('css')

###*
# Compile files from _scss into both _site/js (for live injecting) and site (for future jekyll builds)
###
gulp.task 'coffee', ->
  gulp.src('_scss/main.coffee').pipe(sass(
    includePaths: [ 'coffee' ]
    onError: browserSync.notify)).pipe(prefix([
    'last 15 versions'
    '> 1%'
    'ie 8'
    'ie 7'
  ], cascade: true))
  .pipe(gulp.dest('_site/js'))
  .pipe(browserSync.reload(stream: true))
  .pipe gulp.dest('js')


###*
# Watch scss files for changes & recompile
# Watch html/md files, run jekyll & reload BrowserSync
###
gulp.task 'watch', ->
  gulp.watch '_scss/*.scss', [ 'sass' ]
  gulp.watch '_js/*.coffe', [ 'coffee' ]
  gulp.watch [
    '*.html'
    '_layouts/*.html'
    '_posts/*'
  ], [ 'jekyll-rebuild' ]
  return

###*
# Default task, running just `gulp` will compile the sass,
# compile the jekyll site, launch BrowserSync & watch files.
###
gulp.task 'default', [
  'browser-sync'
  'watch'
]
