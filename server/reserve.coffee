# **Reserve** is a system module which offers services on Chocolate system database  

Path = require 'path'
lateDB = require '../general/latedb'
{Uuid} = _ = require '../general/chocodash'

Space = _.prototype
    constructor: (@path = '.', @name = 'reserve.db.log') ->
        Space.spaces[@name] = this
        @db_path = @path + '/' + @name
        @db = lateDB(@name, @path)
        @tables = @db.tables
        @world = @db.world
        
        constants = {}
        @constants = do =>
            pathname = @path + '/constants'
            try constants = require Path.resolve pathname
            constants ?= {}
        return

    adopt:
        # spaces collection and accessors
        spaces : {}
        ensure : (path, name) -> Space.spaces[path + '/' + name] ? new Space(path, name)
        get : (path) -> Space.spaces[path]

    # `uuid` -  Retrieve uuid value from an object
    uuid: (object, name, parent) ->
        return undefined unless object?
        
        object.uuid ? object._?._?.uuid ? parent?._?[name]?.uuid

    select: (query) ->
        if query.path? then query.path = "#{@name}.#{query.path}"
        @db.world.select.apply @db.world, arguments
    
    insert: (path, object) ->
        uuid = @uuid(object)
        return unless uuid? and path? and object?
        @db.world.insert.call @db.world, "#{@name}.#{path}", @uuid(object), object
    
    update: (path, update) -> 
        uuid = @uuid(update)
        return unless uuid? and path? and update?
        @db.world.update.call @db.world, "#{@name}.#{path}", @uuid(update), update
    
    delete: (path, uuid) -> 
        return unless uuid? and path?
        @db.world.delete.call @db.world, "#{@name}.#{path}", uuid
    
exports.Space = Space