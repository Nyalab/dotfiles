{Disposable, CompositeDisposable} = require 'atom'
{$$, View} = require 'space-pen'

module.exports =
class KeyPeekView extends View
  @content: ->
    @div class: 'key-peek panel-bottom padding', =>
      @div outlet: 'commands', class: 'panel-body padded padding'

  initialize: ->
    @on 'click', '.source', (event) -> atom.workspace.open(event.target.innerText)

  serialize: ->
    attached: @panel?.isVisible()

  destroy: ->
    @detach()

  toggle: ->
    if @panel?.isVisible()
      @detach()
    else
      @attach()

  attach: ->
    @disposables = new CompositeDisposable

    @panel = atom.workspace.addBottomPanel(item: this)
    @disposables.add new Disposable =>
      @panel.destroy()
      @panel = null

    @disposables.add atom.keymaps.onDidMatchBinding ({keystrokes, binding, keyboardEventTarget}) =>
      @update(keystrokes, binding, keyboardEventTarget)


  detach: ->
    @disposables?.dispose()


  update: (keystrokes, keyBinding, keyboardEventTarget) ->
    @commands.html $$ ->
      @table class: 'table-condensed', =>
        if keyBinding
          @tr class: 'used', =>
            @td class: 'inline-block command highlight-success', keyBinding.command
            @td class: 'selector text-highlight', keyBinding.selector
            @td class: 'keystroke highlight', '  '+keystrokes
            @td class: 'source text-info', keyBinding.source
