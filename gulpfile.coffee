gulp = require('gulp')
gutil = require('gulp-util')
browserSync = require('browser-sync')
prefix = require('gulp-autoprefixer')
#cp = require('child_process')
exec = require('gulp-exec')

imagemin = require('gulp-imagemin')
pngquant = require('imagemin-pngquant')

sass = require('gulp-sass')
cssmin = require('gulp-cssmin')

coffee = require('gulp-coffee')
uglify = require('gulp-uglify')

rename = require('gulp-rename')
sourcemaps = require('gulp-sourcemaps')

#path = require('path')
ghPages = require('gulp-gh-pages')

#messages = jekyllBuild: '<span style="color: grey">Running:</span> $ bundle exec jekyll build'

###*
# Build the Jekyll Site
###
gulp.task 'jekyll-build', (cb) ->
#  cp.spawn('bundle', ['exec', 'jekyll', 'build'], stdio: 'inherit').on 'close', cb
  gulp.src('./')
    .pipe(
      exec 'bundle exec jekyll build', (err, stdout, stderr) ->
        gutil.log stdout
        gutil.log stderr
        cb err
        return
  )
###*
# Rebuild Jekyll & do page reload
###
gulp.task 'jekyll-rebuild', ['jekyll-build'], ->
  browserSync.reload()
  return

###*
# Wait for jekyll-build, then launch the Server
###
gulp.task 'browser-sync', ->
  browserSync server:
    baseDir: '_site'
  return

###*
# Compile files from _scss into both _site/css (for live injecting) and site (for future jekyll builds)
###
gulp.task 'sass', ->
  gulp.src(['_scss/**/*.scss', 'css/**/*.scss'])
    .pipe sourcemaps.init()
    .pipe sass(
      includePaths: ['scss']
      onError: browserSync.notify
    )
    .pipe(prefix([
        'last 15 versions'
        '> 1%'
        'ie 8'
        'ie 7'
      ], cascade: true))
    .pipe(cssmin())
    .pipe(rename(suffix: '.min'))
    .pipe sourcemaps.write('.')
    .pipe gulp.dest('_site/css')
    .pipe browserSync.reload(stream: true)

###*
# Compile files from _scss into both _site/js (for live injecting) and site (for future jekyll builds)
###

gulp.task 'coffee', ->
  gulp.src('js/main.coffee')
    .pipe sourcemaps.init()
    .pipe coffee(
      bare: true
      includePaths: ['coffee']
      onError: browserSync.notify
    )
    .pipe sourcemaps.write('.')
    # todo: minify js, currently failing :(
    #uglify()
    #.pipe(uglify())
    .pipe(rename(suffix: '.min'))
    .pipe gulp.dest('_site/js')
    .pipe browserSync.reload(stream: true)


gulp.task 'imagemin', ->
  gulp.src('images/**/*')
    .pipe imagemin(
      progressive: true
      svgoPlugins: [
        {removeViewBox: false}
        {cleanupIDs: false}
      ]
      use: [
        pngquant()
      ])
    .pipe gulp.dest('_site/images')


gulp.task 'deploy', ->
  gulp.src('_site/**/*').pipe ghPages(
    branch: 'master'
  )

###*
# Watch scss files for changes & recompile
# Watch html/md files, run jekyll & reload BrowserSync
###
gulp.task 'watch', ->
  gulp.watch ['_scss/**/*.scss', 'css/**/*.scss'], ['sass']
  gulp.watch 'js/**/*.coffee', ['coffee']
  gulp.watch [
    '*.md'
    '*.html'
    '_layouts/*.html'
    '_includes/*.html'
    '_posts/*'
    'images/*'
  ], ['jekyll-rebuild', 'coffee', 'sass']
  return

###
# Does everything
###
gulp.task 'build', ['jekyll-build'], ->
  gulp.start 'sass'
  gulp.start 'coffee'
  gulp.start 'imagemin'

###*
# Default task, running just `gulp` will compile the sass,
# compile the jekyll site, launch BrowserSync & watch files.
###
gulp.task 'default', [
  'build'
  'browser-sync'
  'watch'
]
