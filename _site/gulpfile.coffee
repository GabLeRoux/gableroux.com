gulp = require('gulp')
browserSync = require('browser-sync')
sass = require('gulp-sass')
prefix = require('gulp-autoprefixer')
cp = require('child_process')

messages = jekyllBuild: '<span style="color: grey">Running:</span> $ bundle exec jekyll build'

###*
# Build the Jekyll Site
###
gulp.task 'jekyll-build', (done) ->
  browserSync.notify messages.jekyllBuild
  cp.spawn('bundle', ['exec', 'jekyll', 'build'], stdio: 'inherit').on 'close', done

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
  gulp.src(['_scss/**/*.scss', 'css/**/*.scss'])
  .pipe sass(
    includePaths: [ 'scss' ]
    onError: browserSync.notify
  )
  .pipe(prefix([
      'last 15 versions'
      '> 1%'
      'ie 8'
      'ie 7'
    ], cascade: true)
  )
  .pipe gulp.dest('_site/css')
  .pipe browserSync.reload(stream: true)

###*
# Compile files from _scss into both _site/js (for live injecting) and site (for future jekyll builds)
###
gulp.task 'coffee', ->
  gulp.src('js/**/*.coffee')
  .pipe coffee(
    includePaths: [ 'coffee' ]
    onError: browserSync.notify)
  .pipe(prefix([
    'last 15 versions'
    '> 1%'
    'ie 8'
    'ie 7'
  ], cascade: true))
  .pipe gulp.dest('_site/js')
  .pipe browserSync.reload(stream: true)


###*
# Watch scss files for changes & recompile
# Watch html/md files, run jekyll & reload BrowserSync
###
gulp.task 'watch', ->
  gulp.watch ['_scss/**/*.scss', 'css/**/*.scss'], [ 'sass' ]
  gulp.watch 'js/**/*.coffee', [ 'coffee' ]
  gulp.watch [
    '*.md'
    '*.html'
    '_layouts/*.html'
    '_includes/*.html'
    '_posts/*'
    'images/*'
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
