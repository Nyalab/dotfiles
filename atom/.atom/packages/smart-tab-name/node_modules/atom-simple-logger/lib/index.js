(function() {
  var getRandomColor, nsps, nullFunc;

  getRandomColor = function() {
    var color, i, j, letters;
    letters = '0123456789ABCDEF'.split('');
    color = '#';
    for (i = j = 0; j <= 5; i = ++j) {
      color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
  };

  nullFunc = function() {
    return function() {
      return null;
    };
  };

  nsps = {};

  module.exports = function(arg) {
    var debugLevel, log, nsp, pkg;
    pkg = arg.pkg, nsp = arg.nsp;
    if (pkg == null) {
      throw new Error("no pkg provided");
    }
    if (!atom.inDevMode()) {
      return nullFunc;
    }
    debugLevel = atom.config.get(pkg + ".debug");
    if ((debugLevel != null) && debugLevel > 0) {
      log = function(nsp) {
        var nspColor, nspString;
        if (nsps[nsp] == null) {
          nsps[nsp] = getRandomColor();
        }
        nspColor = nsps[nsp];
        nspString = pkg + "." + nsp;
        return function(string, lvl) {
          if ((lvl == null) || debugLevel >= lvl) {
            return console.log("%c" + nspString + ":", "color:" + nspColor, "" + string);
          }
        };
      };
      if (nsp != null) {
        return log(nsp);
      } else {
        return log;
      }
    } else {
      return nullFunc;
    }
  };

}).call(this);
