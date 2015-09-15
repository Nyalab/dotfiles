module.exports =
  keyPeekView: null

  activate: ({attached}={}) ->
    @createView().toggle() if attached
    atom.commands.add 'atom-workspace',
      'key-peek:toggle': => @createView().toggle()
      'core:cancel': =>  @createView().detach()
      'core:close': =>  @createView().detach()

  createView: ->
    unless @keyPeekView?
      KeyPeekView = require './key-peek-view'
      @keyPeekView = new KeyPeekView()
    @keyPeekView

  deactivate: ->
    @keyPeekView?.destroy()

  serialize: ->
    @keyPeekView?.serialize()
