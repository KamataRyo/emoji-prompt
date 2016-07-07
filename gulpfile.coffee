gulp =   require 'gulp'
coffee = require 'gulp-coffee'
src = 'www/app.coffee'

gulp.task 'coffee', ->
    gulp.src src
        .pipe coffee bare:false
        .pipe gulp.dest 'www/'

gulp.task 'watch', ['coffee'], ->
    gulp.watch src, ['coffee']
