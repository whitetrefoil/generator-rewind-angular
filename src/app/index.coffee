'use strict'

yeoman = require 'yeoman-generator'

class Generator extends yeoman.generators.NamedBase
  constructor: (args...) ->
    args[0][0] ||= 'rewind-angular'
    super args...

  showName: ->
    console.log @name

module.exports = Generator
