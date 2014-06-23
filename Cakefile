#### Predefine
SOURCE_DIR = './src'
BUILD_DIR = './generators'


#### npm libs
fs = require 'fs-extra'
util = require 'util'
path = require 'path'
exec = require('child_process').exec
require 'colors'

#### Helpers

# Wipe a whole dir
cleanDir = (path) ->
  try
  # the exception of wrench's rmdir is missing `errno` & `code`
  # try original rmdir first.
    fs.removeSync path
  catch e
    switch e.code
      when 'ENOTEMPTY'
        wrench.rmdirSyncRecursive path
      when 'ENOENT'
      # Do nothing if there's no such dir
      else
        throw e


# wipe the build dir before build
cleanBuildDir = -> cleanDir BUILD_DIR

# build all files
buildAll = (needMap = false) ->
  cleanBuildDir()
  exec "node node_modules/coffee-script/bin/coffee #{if needMap then '-m' else ''} -co #{BUILD_DIR} #{SOURCE_DIR}",
    stdio: 'inherit'


#### Tasks

task 'build', 'build the source code (coffee) to js', ->
  buildAll().on 'close', (code) ->
    if code is 0
      console.log 'Done!'.green
    else
      console.error 'Failed!'.red
