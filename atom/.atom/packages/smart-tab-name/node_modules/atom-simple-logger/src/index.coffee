# out: ../lib/index.js

getRandomColor = ->
  letters = '0123456789ABCDEF'.split('')
  color = '#'
  for i in [0..5]
    color += letters[Math.floor(Math.random() * 16)]
  return color

nullFunc  = -> return -> return null

nsps = {}

module.exports = ({pkg,nsp}) ->
  throw new Error "no pkg provided" unless pkg?
  unless atom.inDevMode()
    return nullFunc
  debugLevel = atom.config.get("#{pkg}.debug")
  if debugLevel? and debugLevel > 0
    log = (nsp) ->
      unless nsps[nsp]?
        nsps[nsp] = getRandomColor()
      nspColor = nsps[nsp]
      nspString = "#{pkg}.#{nsp}"
      return (string,lvl) ->
        if not lvl? or debugLevel >= lvl
          console.log "%c#{nspString}:","color:#{nspColor}", "#{string}"
    if nsp?
      return log(nsp)
    else
      return log
  else
    return nullFunc
