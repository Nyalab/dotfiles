{CompositeDisposable} = require 'atom'
definebabe = require 'definebabe'
emily = definebabe.default.search('Dillion Harper')

Template = """
<div class="pic"></div>
"""

module.exports =
class BackgroundPicElement extends HTMLElement
  StartDelay: 500

  createdCallback: ->
    @disposables = new CompositeDisposable
    @disposables.add atom.workspace.onDidAddPane => @updateVisibility()
    @disposables.add atom.workspace.onDidDestroyPane => @updateVisibility()
    @disposables.add atom.workspace.onDidChangeActivePaneItem => @updateVisibility()

    @startTimeout = setTimeout((=> @updateVisibility()), @StartDelay)

  attachedCallback: ->
    @innerHTML = Template
    today = new Date()
    todayDate = today.getDate() - 1
    @pic = @querySelector('.pic')
    pic = @pic
    
    #loading image
    pic.style.backgroundImage = 'url(http://d1v8u1ev1s9e4n.cloudfront.net/569ddd83ddcb216416f45d18)'
    emily.then (data) ->
      definebabe.default.galleries(data.id, data.slug).then (res) ->
        rand = res[Math.floor(Math.random() * res.length)]
        definebabe.default.gallery(rand.id, data.slud).then (gallery) ->
          randPic = gallery.images[Math.floor(Math.random() * gallery.images.length)]
          console.log pic
          pic.style.backgroundImage = 'url(' + randPic + ')'

  updateVisibility: ->
    if @shouldBeAttached()
      @attach()
    else
      @detach()

  shouldBeAttached: ->
    atom.workspace.getPanes().length is 1 and not atom.workspace.getActivePaneItem()?

  attach: ->
    paneView = atom.views.getView(atom.workspace.getActivePane())
    paneView.appendChild(this)

  detach: ->
    @remove()

module.exports = document.registerElement 'background-pic', prototype: BackgroundPicElement.prototype
